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
public class PacientesDao { // Data Acess Object padrão
    
    public List<Pacientes> getLista(){
        String sql = "select * from pacientes";
        List<Pacientes> lista = new ArrayList<>();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                Pacientes objPacientes = new Pacientes();
                objPacientes.setCodigo(rs.getInt("codPaciente"));
                objPacientes.setNome(rs.getString("nomePaciente"));
                objPacientes.setCpf(rs.getString("cpfPaciente"));
                objPacientes.setTelefone(rs.getString("telefonePaciente"));
                objPacientes.setEmail(rs.getString("emailPaciente"));
         
                lista.add(objPacientes);
            }
        }catch(SQLException ex){
            JOptionPane.showMessageDialog(null, "Erro de SQL: "+ ex.getMessage());
        }
        return lista;
    }
    
    
    public boolean incluir(Pacientes objPacientes){
        String sql = "insert into pacientes(nomePaciente, cpfPaciente, telefonePaciente, emailPaciente) values (?,?,?,?)";
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setString(1, objPacientes.getNome());
            pst.setString(2, objPacientes.getCpf());
            pst.setString(3, objPacientes.getTelefone());
            pst.setString(4, objPacientes.getEmail());
            //pst.setString(2, objPacientes.getUf());
            if(pst.executeUpdate()>0){
                JOptionPane.showMessageDialog(null, "Paciente cadastrado com sucesso!");
                return true;
            }else{
                JOptionPane.showMessageDialog(null, "Paciente não cadastrado!");
                return false;
            }
        }catch(SQLException ex){
            JOptionPane.showMessageDialog(null,"Erro de SQL: "+ ex.getMessage());
        }
        return false;
    }
    public boolean alterar(Pacientes objPacientes){
        String sql = "update pacientes set nomePaciente=?, cpfPaciente=?, telefonePaciente=?, emailPaciente=?  where codPaciente=?";
        //String sql = "update cidade set nomeCidade=?, ufCidade=? where codCidade=?";
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setString(1, objPacientes.getNome());
            pst.setString(2, objPacientes.getCpf());
            pst.setString(3, objPacientes.getTelefone());
            pst.setString(4, objPacientes.getEmail());
            //pst.setString(2, objPacientes.getUf());
            pst.setInt(5, objPacientes.getCodigo());
            if(pst.executeUpdate()>0){
                JOptionPane.showMessageDialog(null, "Paciente atualizado com sucesso!");
                return true;
            }else{
                JOptionPane.showMessageDialog(null, "Paciente não atualizado!");
                return false;
            }
        }catch(SQLException ex){
            JOptionPane.showMessageDialog(null,"Erro de SQL: "+ ex.getMessage());
        }
        return false;
    }
    
    public boolean remover(Pacientes objPacientes){
        String sql = "delete from  pacientes where codPaciente=?";
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            /*pst.setString(1, objCidade.getNome());
            pst.setString(2, objCidade.getUf());*/
            pst.setInt(1, objPacientes.getCodigo());
            if(pst.executeUpdate()>0){
                JOptionPane.showMessageDialog(null, "Paciente removido com sucesso!");
                return true;
            }else{
                JOptionPane.showMessageDialog(null, "Paciente não removido!");
                return false;
            }
        }catch(SQLException ex){
            JOptionPane.showMessageDialog(null,"Erro de SQL: "+ ex.getMessage());
        }
        return false;
    }
    
    public boolean salvar(Pacientes obj){
        if(obj.getCodigo()==null){
            return incluir(obj);
            /*Integer codigo = Dados.listaCidade.size()+1;
            obj.setCodigo(codigo);
            Dados.listaCidade.add(obj);*/
        }else{
            return  alterar(obj);
        }
       
    }
    
    public Pacientes localizar(Integer id){
        String sql = "select * from pacientes where codPaciente=?";
        Pacientes obj = new Pacientes();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery(); 
               while(rs.next()){
                   obj.setCodigo(rs.getInt("codPaciente"));
                   obj.setNome(rs.getString("nomePaciente"));
                   obj.setCpf(rs.getString("cpfPaciente"));
                   obj.setTelefone(rs.getString("telefonePaciente"));
                   obj.setEmail(rs.getString("emailPaciente"));
                   //obj.setUf(rs.getString("ufCidade"));
                   return obj;
               }
           }catch (SQLException e){
               JOptionPane.showMessageDialog(null, "Erro de SQL localizar"+e.getMessage());
           }
        return null;
    }
}
