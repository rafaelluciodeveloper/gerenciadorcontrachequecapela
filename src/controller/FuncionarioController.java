/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.FuncionarioDAO;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.StringTokenizer;
import model.Funcionario;

/**
 *
 * @author Rafael
 */
@Resource
public class FuncionarioController {

    private final Result result;
    private final FuncionarioDAO funcionarioDAO;

    public FuncionarioController(Result result, FuncionarioDAO funcionarioDAO) {
        this.result = result;
        this.funcionarioDAO = funcionarioDAO;
    }

    @Path("/funcionarios")
    public List<Funcionario> index() {
        return funcionarioDAO.listar();
    }

    @Path("/funcionarios/adicionar")
    public void adicionar() {

    }

    @Path("/funcionarios/adicionartxt")
    public void adicionartxt() {

    }

    @Path("/funcionarios/importar")
    public void importar(Funcionario funcionario, String file) throws IOException {
        String linha = null;
        try {
            FileReader reader = new FileReader(file); // Localização do Arquivo  
            BufferedReader leitor = new BufferedReader(reader);
            StringTokenizer st = null;
            while ((linha = leitor.readLine()) != null) {
                st = new StringTokenizer(linha, "|");
                String dados = null;
                while (st.hasMoreTokens()) {

                    dados = st.nextToken();
                    funcionario.setMatricula(dados);

                    dados = st.nextToken();
                    funcionario.setNome(dados);

                    dados = st.nextToken();
                    funcionario.setCpf(dados);

                    dados = st.nextToken();
                    funcionario.setPis(dados);

                    dados = st.nextToken();
                    funcionario.setAdmissao(dados);

                }
            }
            leitor.close();
            reader.close();
            try {
                funcionarioDAO.adicionar(funcionario);
            } catch (SQLException ex) {
                ex.printStackTrace();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        result.include("msg", "success");
        result.include("msg2", "Arquivo Importado com Suscesso").redirectTo(this).index();
    }

    @Path("/funcionarios/salvar")
    public void salvar(Funcionario funcionario) {
        try {
            funcionarioDAO.adicionar(funcionario);
            result.include("msg", "sucess");
            result.include("msg3", "Funcionario Salvo com Suscesso");
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    }

    @Path("/funcionarios/editar/{id}")
    public Funcionario editar(String id
    ) {
        return funcionarioDAO.listaPorid(id);
    }

    @Path("/funcionario/atualizar")
    public void atualizar(Funcionario funcionario) {
        try {
            funcionarioDAO.editar(funcionario);
            result.include("msg", "success");
            result.include("msg2", "Funcionario Atualizado Com Suscesso");
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    @Path("/funcionarios/excluir/{id}")
    public void excluir(String id) {
        funcionarioDAO.excluir(id);
        result.include("msg", "success");
        result.include("msg2", "Funcionario Excluido com Suscesso").redirectTo(this).index();
    }
}
