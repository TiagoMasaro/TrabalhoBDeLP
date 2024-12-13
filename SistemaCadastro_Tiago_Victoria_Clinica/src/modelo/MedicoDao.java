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

public class MedicoDao { // Data Acess Object padrão

    EspecialidadeDao objEspecialidadeDao = new EspecialidadeDao();

    public List<Medico> getLista() {
        String sql = "select * from medicos";
        List<Medico> lista = new ArrayList<>();
        try {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Medico objMedico = new Medico();
                objMedico.setCodigo(rs.getInt("codMedico"));
                objMedico.setNome(rs.getString("nomeMedico"));
                objMedico.setCpf(rs.getString("cpfMedico"));
              objMedico.setCrm(rs.getString("crmMedico"));
              objMedico.setEmail(rs.getString("emailMedico"));
                objMedico.setObjEspecialidade(objEspecialidadeDao.localizar(rs.getInt("especialidadeMedico")));
                lista.add(objMedico);
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro de SQL: " + ex.getMessage());
        }
        return lista;
    }

    public boolean incluir(Medico objMedico) {
        String sql = "insert into medicos(nomeMedico,cpfMedico,crmMedico,emailMedico,especialidadeMedico) values(?,?,?,?,?)";
        try {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setString(1, objMedico.getNome());
            pst.setString(2, objMedico.getCpf());
            pst.setString(3, objMedico.getCrm());
            pst.setString(4, objMedico.getEmail());
             pst.setInt(5, objMedico.getObjEspecialidade().getCodEspecialidade());
           
            if (pst.executeUpdate() > 0) {
                JOptionPane.showMessageDialog(null, "Médico cadastrado com sucesso!");
                return true;
            } else {
                JOptionPane.showMessageDialog(null, "Médico não cadastrado!");
                return false;
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro de SQL: " + ex.getMessage());
        }
        return false;
    }

    public boolean alterar(Medico objMedico) {
        String sql = "update medicos set nomeMedico=?, cpfMedico=?, crmMedico=?, emailMedico=?,especialidadeMedico=?  where codMedico=?";
        try {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setString(1, objMedico.getNome());
            pst.setString(2, objMedico.getCpf());
            pst.setString(3, objMedico.getCrm());
            pst.setString(4, objMedico.getEmail());
            pst.setInt(5, objMedico.getObjEspecialidade().getCodEspecialidade());
            pst.setInt(6, objMedico.getCodigo());
            if (pst.executeUpdate() > 0) {
                JOptionPane.showMessageDialog(null, "Médico alterado com sucesso!");
                return true;
            } else {
                JOptionPane.showMessageDialog(null, "Médico não alterada!");
                return false;
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro de SQL: " + ex.getMessage());
        }
        return false;
    }

    public boolean remover(Medico objMedico) {
        String sql = "delete from medicos where codMedico=?";
        try {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, objMedico.getCodigo());
            if (pst.executeUpdate() > 0) {
                JOptionPane.showMessageDialog(null, "Médico excluído com sucesso!");
                return true;
            } else {
                JOptionPane.showMessageDialog(null, "Médico não excluído!");
                return false;
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro de SQL: " + ex.getMessage());
        }
        return false;
    }

    public boolean salvar(Medico obj) {
        if (obj.getCodigo() == null) {
            return incluir(obj);
        } else {
            return alterar(obj);
        }

    }
    
    public Medico localizar(Integer id){
        String sql = "select * from medicos where codMedico=?";
        Medico obj = new Medico();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery(); 
               while(rs.next()){
                   obj.setCodigo(rs.getInt("codMedico"));
                   obj.setNome(rs.getNString("nomeMedico"));
                   obj.setCpf(rs.getNString("cpfMedico"));
                   obj.setCrm(rs.getNString("crmMedico"));
                   obj.setEmail(rs.getNString("emailMedico"));
                  
                   return obj;
               }
               
           }catch (SQLException e){
               JOptionPane.showMessageDialog(null, "Erro de SQL localizar"+e.getMessage());
           }
        return null;
    }

}
