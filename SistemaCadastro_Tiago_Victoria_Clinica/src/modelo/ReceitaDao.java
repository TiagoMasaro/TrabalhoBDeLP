/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;

/**
 *
 * @author tulio
 */
public class ReceitaDao { // Data Acess Object padrão
    
    ConverteDataUtilitario converte = new ConverteDataUtilitario();   
    PacientesDao objCidadeDao = new PacientesDao();
    
    public List<Receita> getLista(){
        String sql = "select * from receita";
        List<Receita> lista = new ArrayList<>();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                Receita objReceita = new Receita();
                //setCodigo(rs.getInt("codReceita"));
                objReceita.setCodigo(rs.getInt("codReceita"));
                objReceita.setRemediosPrescritos(rs.getString("remediosPrescritos"));
                lista.add(objReceita);
                
                /*java.sql.Date dt = rs.getDate("nascimentoFuncionario");
                Calendar c = Calendar.getInstance();
                c.setTime(dt);
                objFuncionario.setNascimento(c);*/
            }
        }catch(SQLException ex){
            JOptionPane.showMessageDialog(null, "Erro de SQL: "+ ex.getMessage());
        }
        return lista;
    }
    
    
    public boolean incluir(Receita objReceita){
        String sql = "insert into receita(remediosPrescritos) values (?)";
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setString(1, objReceita.getRemediosPrescritos());
      
            if(pst.executeUpdate()>0){
                JOptionPane.showMessageDialog(null, "Receita cadastrada com sucesso!");
                return true;
            }else{
                JOptionPane.showMessageDialog(null, "Receita não cadastrada!");
                return false;
            }
        }catch(SQLException ex){
            JOptionPane.showMessageDialog(null,"Erro de SQL: "+ ex.getMessage());
        }
        return false;
    }
    
    public boolean alterar(Receita objReceita){
        String sql = "update receita set remediosPrescritos=?  where codReceita=?";
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setString(1, objReceita.getRemediosPrescritos());
            pst.setInt(2, objReceita.getCodigo());
            
            if(pst.executeUpdate()>0){
                JOptionPane.showMessageDialog(null, "Receita alterada com sucesso!");
                return true;
            }else{
                JOptionPane.showMessageDialog(null, "Receita não alterada!");
                return false;
            }
        }catch(SQLException ex){
            JOptionPane.showMessageDialog(null,"Erro de SQL: "+ ex.getMessage());
        }
        return false;
    }
    
    public boolean remover(Receita objReceita){
        String sql = "delete from  receita where codReceita=?";
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            /*pst.setString(1, objCidade.getNome());
            pst.setString(2, objCidade.getUf());*/
            pst.setInt(1, objReceita.getCodigo());
            if(pst.executeUpdate()>0){
                JOptionPane.showMessageDialog(null, "Receita removida com sucesso!");
                return true;
            }else{
                JOptionPane.showMessageDialog(null, "Receita não removido!");
                return false;
            }
        }catch(SQLException ex){
            JOptionPane.showMessageDialog(null,"Erro de SQL: "+ ex.getMessage());
        }
        return false;
    }
    
    public boolean salvar(Receita obj){
        if(obj.getCodigo()==null){
            return incluir(obj);
            /*Integer codigo = Dados.listaCidade.size()+1;
            obj.setCodigo(codigo);
            Dados.listaCidade.add(obj);*/
        }else{
            return  alterar(obj);
        }
       
    }
 
}
