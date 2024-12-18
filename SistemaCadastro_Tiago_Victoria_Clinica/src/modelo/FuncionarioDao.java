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

public class FuncionarioDao { // Data Acess Object padrão

    CargoFuncionarioDao objCargoFuncionarioDao = new CargoFuncionarioDao();

    public List<Funcionario> getLista() {
        String sql = "select * from funcionarios";
        List<Funcionario> lista = new ArrayList<>();
        try {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Funcionario objFuncionario = new Funcionario();
                objFuncionario.setCodMedico(rs.getInt("codFuncionario"));
                objFuncionario.setNome(rs.getString("nomeFuncionario"));
                objFuncionario.setSalario(rs.getDouble("salarioFuncionario"));
                objFuncionario.setObjcargoFuncionario(objCargoFuncionarioDao.localizar(rs.getInt("cargoFuncionario_codCargo")));
                lista.add(objFuncionario);
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro de SQL: " + ex.getMessage());
        }
        return lista;
    }

    public boolean incluir(Funcionario objFuncionario) {
        String sql = "insert into funcionarios(nomeFuncionario, salarioFuncionario, cargoFuncionario_codCargo) values(?,?,?)";
        try {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setString(1, objFuncionario.getNome());
            pst.setDouble(2, objFuncionario.getSalario());
             pst.setInt(3, objFuncionario.getObjcargoFuncionario().getCodCargo());
           
            if (pst.executeUpdate() > 0) {
                JOptionPane.showMessageDialog(null, "Funcionario cadastrado com sucesso!");
                return true;
            } else {
                JOptionPane.showMessageDialog(null, "Funcionario não cadastrado!");
                return false;
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro de SQL: " + ex.getMessage());
        }
        return false;
    }

    public boolean alterar(Funcionario objFuncionario) {
        String sql = "update funcionarios set nomeFuncionario=?, salarioFuncionario=?, objcargoFuncionario=?  where codFuncionario=?";
        try {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setString(1, objFuncionario.getNome());
            pst.setDouble(2, objFuncionario.getSalario());
            pst.setInt(3, objFuncionario.getObjcargoFuncionario().getCodCargo());
            pst.setInt(4, objFuncionario.getCodMedico());
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
            pst.setInt(1, objMedico.getCodMedico());
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
        if (obj.getCodMedico()== null) {
            return incluir(obj);
        } else {
            return alterar(obj);
        }

    }
    
    public Funcionario localizar(Integer id){
        String sql = "select * from funcionarios where codFuncionario=?";
        Funcionario obj = new Funcionario();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery(); 
               while(rs.next()){
                   obj.setCodMedico(rs.getInt("codFuncionario"));
                   obj.setNome(rs.getNString("nomeFuncionario"));
                   obj.setSalario(rs.getDouble("salarioFuncionario"));
                  
                   return obj;
               }
               
           }catch (SQLException e){
               JOptionPane.showMessageDialog(null, "Erro de SQL localizar"+e.getMessage());
           }
        return null;
    }

}
