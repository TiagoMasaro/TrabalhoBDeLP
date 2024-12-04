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

public class CargoFuncionarioDao { // Data Acess Object padrão

    public List<CargoFuncionario> getLista() {
        String sql = "select * from cargofuncionario";
        List<CargoFuncionario> lista = new ArrayList<>();
        try {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                CargoFuncionario objCargoFuncionario = new CargoFuncionario();
                objCargoFuncionario.setCodCargo(rs.getInt("codCargo"));         
                objCargoFuncionario.setNomeCargo(rs.getString("nomeCargo"));
                lista.add(objCargoFuncionario);
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro de SQL: " + ex.getMessage());
        }
        return lista;
    }

    public boolean incluir(CargoFuncionario objCargoFuncionario) {
        String sql = "insert into cargofuncionario (nomeCargo) values(?)";
        try {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setString(1, objCargoFuncionario.getNomeCargo());
          
            if (pst.executeUpdate() > 0) {
                JOptionPane.showMessageDialog(null, "O cargo do funcionário foi cadastrado com sucesso!");
                return true;
            } else {
                JOptionPane.showMessageDialog(null, "Cargo não cadastrada!");
                return false;
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro de SQL: " + ex.getMessage());
        }
        return false;
    }

    public boolean alterar(CargoFuncionario objCargoFuncionario) {
        String sql = "update cargofuncionario set nomeCargo=? where codCargo=?";
        try {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setString(1,objCargoFuncionario.getNomeCargo() );
            pst.setInt(2, objCargoFuncionario.getCodCargo());
            if (pst.executeUpdate() > 0) {
                JOptionPane.showMessageDialog(null, "Cargo alterado com sucesso!");
                return true;
            } else {
                JOptionPane.showMessageDialog(null, "Cargo não alterada!");
                return false;
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro de SQL: " + ex.getMessage());
        }
        return false;
    }

    public boolean remover(CargoFuncionario objCargoFuncionario) {
        String sql = "delete from cargofuncionario where codCargo=?";
        try {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, objCargoFuncionario.getCodCargo());
            if (pst.executeUpdate() > 0) {
                JOptionPane.showMessageDialog(null, "Cargo excluído com sucesso!");
                return true;
            } else {
                JOptionPane.showMessageDialog(null, "Cargo não excluído!");
                return false;
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro de SQL: " + ex.getMessage());
        }
        return false;
    }

    public boolean salvar(CargoFuncionario objCargoFuncionario) {
        if (objCargoFuncionario.getCodCargo() == null) {
            return incluir(objCargoFuncionario);
        } else {
            return alterar(objCargoFuncionario);
        }

    }
    
     public CargoFuncionario localizar(Integer idCargo){
        String sql = "select * from cargofuncionario where codCargo=?";
        CargoFuncionario objCargoFuncionario = new CargoFuncionario();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, idCargo);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                objCargoFuncionario.setCodCargo(rs.getInt("codCargo"));
                objCargoFuncionario.setNomeCargo(rs.getString("NomeCargo"));
                return objCargoFuncionario;
            }
        }catch(SQLException e){
            JOptionPane.showMessageDialog
        (null,"Erro de SQL Localizar"+e.getMessage());
    }
        return null;
    }

}
