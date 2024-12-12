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
//import java.util.Calendar;
import java.util.List;
import javax.swing.JOptionPane;

/**
 *
 * @author 12968505602
 */
public class MedicoDao { // Data Acess Object padrão
    
    //ConverteDataUtilitario converte = new ConverteDataUtilitario();   
    EspecialidadeDao objEspecialidadeDao = new EspecialidadeDao();
    
    public List<Medico> getLista(){
        String sql = "select * from medicos";
        List<Medico> lista = new ArrayList<>();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                Medico objMedico = new Medico();
                objMedico.setCodigo(rs.getInt("codMedico"));
                objMedico.setNome(rs.getString("nomeMedico"));
                objMedico.setCpf(rs.getString("cpfMedico"));
                objMedico.setCrm(rs.getString("crmMedico"));
                objMedico.setEmail(rs.getString("emailMedico"));
                objMedico.setObjespecialidade_codEspecialidade(Integer.MIN_VALUE);
                //objMedico.setObjespecialidade_codEspecialidade(objEspecialidadeDao.localizar(rs.getInt("especialidade_codEspecialidade")));
                //objFuncionario.setObjCidade(objCidadeDao.localizar(rs.getInt("cidadeFuncionario"))); 
                lista.add(objMedico);
                
            }
        }catch(SQLException ex){
            JOptionPane.showMessageDialog(null, "Erro de SQL: "+ ex.getMessage());
        }
        return lista;
    }
    
    
    public boolean incluir(Medico objMedico){
        String sql = "insert into funcionario(nomeMedico, cpfMedico, crmMedico, emailMedico, especialidade_codEspecialidade) values (?,?,?,?,?)";
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setString(1, objMedico.getNome());
            pst.setString(2, objMedico.getCpf());
            pst.setString(3, objMedico.getCrm());
            pst.setString(4, objMedico.getEmail());
            pst.setInt(5, objMedico.getObjespecialidade_codEspecialidade()); //Chave estrangeira
            
            if(pst.executeUpdate()>0){
                JOptionPane.showMessageDialog(null, "Medico cadastrado com sucesso!");
                return true;
            }else{
                JOptionPane.showMessageDialog(null, "Medico não cadastrado!");
                return false;
            }
        }catch(SQLException ex){
            JOptionPane.showMessageDialog(null,"Erro de SQL: "+ ex.getMessage());
        }
        return false;
    }
    
    public boolean alterar(Medico objMedico){
        String sql = "update funcionario set nomeMedico=? ,cpfMedico=?, crmMedico=?, emailMedico=?, especialidade_codEspecialidade=? where codMedico=?) values (?,?,?,?,?,?)";
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setString(1, objMedico.getNome());
            pst.setString(2, objMedico.getCpf());
            pst.setString(3, objMedico.getCrm());
            pst.setString(4, objMedico.getEmail());
            pst.setInt(5, objMedico.getObjespecialidade_codEspecialidade()); //Chave estrangeira
            pst.setInt(6, objMedico.getCodigo()); 
            
            
            if(pst.executeUpdate()>0){
                JOptionPane.showMessageDialog(null, "Medico alterado com sucesso!");
                return true;
            }else{
                JOptionPane.showMessageDialog(null, "Medico não alterado!");
                return false;
            }
        }catch(SQLException ex){
            JOptionPane.showMessageDialog(null,"Erro de SQL: "+ ex.getMessage());
        }
        return false;
    }
    
    public boolean remover(Medico objMedico){
        String sql = "delete from  medicos where codMedico=?";
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, objMedico.getCodigo());
            if(pst.executeUpdate()>0){
                JOptionPane.showMessageDialog(null, "Medico removido com sucesso!");
                return true;
            }else{
                JOptionPane.showMessageDialog(null, "Medico não removido!");
                return false;
            }
        }catch(SQLException ex){
            JOptionPane.showMessageDialog(null,"Erro de SQL: "+ ex.getMessage());
        }
        return false;
    }
    
    public boolean salvar(Medico obj){
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
