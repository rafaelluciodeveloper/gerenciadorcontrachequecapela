/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.EmpresaDAO;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import java.sql.SQLException;
import java.util.List;
import model.Empresa;

/**
 *
 * @author Rafael
 */
@Resource
public class EmpresaController {
    private final Result result;
    private final EmpresaDAO empresaDAO;
    
    public EmpresaController(Result result , EmpresaDAO empresaDAO){
        this.result = result;
        this.empresaDAO = empresaDAO;
    }
    
    @Path("/empresas")
    public List<Empresa> index(){
        return empresaDAO.listar();
    }
    
    @Path("/empresas/adicionar")
    public void adicionar(){
       
    }
    
    @Path("/empresas/salvar")
    public void salvar(Empresa empresa){
        try{
            empresaDAO.adicionar(empresa);
            result.include("msg","success");
            result.include("msg2","Empresa Cadastrada com Sucesso").redirectTo(this).index();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
    }
    
    @Path("/empresas/editar/{id}")
    public Empresa editar(String id){
        return empresaDAO.listarPorId(id);
    }
    
    @Path("/empresas/atualizar")
    public void atualizar(Empresa empresa){
        try{
            empresaDAO.editar(empresa);
            result.include("msg","success");
            result.include("msg2","Empresa Atualizada com Sucesso").redirectTo(this).index();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
    }
    
    @Path("/empresas/excluir/{id}")
    public void excluir(String id){
        empresaDAO.excluir(id);
        result.include("msg","success");
        result.include("msg2","Empresa Excluida com Sucesso").redirectTo(this).index();
    }
}
