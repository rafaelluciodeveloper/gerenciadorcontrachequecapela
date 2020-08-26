package controller;

import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class IndexController {

    private final Result result;

    public IndexController(Result result) {
        this.result = result;
    }

    @Path("/")
    public void index() {
        
    }

    @Path("/autenticar")
    public void autenticar() {
            result.include("teste", "error").redirectTo(this).index();
        }
    
}
