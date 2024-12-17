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
import java.util.Calendar;
import java.util.List;
import javax.swing.JOptionPane;

public class AtendimentoDao {


    MedicoDao medicoDao = new MedicoDao();
    PacientesDao pacienteDao = new PacientesDao();
    

    public List<Atendimento> getLista() {
        String sql = "select * from atendimento";
        List<Atendimento> lista = new ArrayList<>();
        try {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Atendimento obj = new Atendimento();
                obj.setCodAtendimento(rs.getInt("codAtendimento"));
                obj.setTipoPagamento(rs.getString("tipoPagamento"));
                obj.setTipoPagamento(rs.getString("dataAtendimento"));
                obj.setTipoPagamento(rs.getString("dataPagamento"));
                obj.setObjMedico(medicoDao.localizar(rs.getInt("medicos_codMedico")));
                obj.setObjPaciente(pacienteDao.localizar(rs.getInt("pacientes_codPaciente")));
                
                lista.add(obj);
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Erro de SQL no getLista()" + e.getMessage());
        }
        return lista;
    }

    public boolean salvar(Atendimento obj) {
        if (obj.getCodAtendimento()== null) {
            return incluir(obj);
        } else {
            return alterar(obj);
        }

    }

    public boolean incluir(Atendimento obj) {
        String sql = "insert into atendimento (pacientes_codPaciente,medicos_codMedico,dataAtendimento,dataPagamento,tipoPagamento) values(?,?,?,?,?)";
        try {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            
             pst.setInt(1, obj.getObjPaciente().getCodigo());
            pst.setInt(2, obj.getObjMedico().getCodMedico());
            pst.setString(3,obj.getDataAtendimento());
            pst.setString(4,obj.getDataPagamento());
              pst.setString(5, obj.getTipoPagamento());
            
          
           
            
            if (pst.executeUpdate() > 0) {
                JOptionPane.showMessageDialog(null, "Atendimento cadastrado");
                return true;
            } else {
                JOptionPane.showMessageDialog(null, "Atendiemnto não cadastrado");
                return false;
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Erro de SQL: " + e.getMessage());

        }
        return false;
    }

    public boolean alterar(Atendimento obj) {
        String sql = "update atendimento set pacientes_codPaciente=?, medicos_codMedico=?, dataAtendimento=?, dataPagamento=?, tipoPagamento=? where codAtendimento=?";
        try {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
           pst.setInt(1, obj.getObjPaciente().getCodigo());
            pst.setInt(2, obj.getObjMedico().getCodMedico());
           pst.setString(3,obj.getDataAtendimento());
            pst.setString(4,obj.getDataPagamento());
              pst.setString(5, obj.getTipoPagamento());
              pst.setInt(6, obj.getCodAtendimento());
              
            if (pst.executeUpdate() > 0) {
                JOptionPane.showMessageDialog(null, "Atendimento alterado");
                return true;
            } else {
                JOptionPane.showMessageDialog(null, "Atendimento não alterado");
                return false;
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Erro de SQL:" + e.getMessage());

        }
        return false;
    }

    public boolean remover(Atendimento obj) {
        String sql = "delete from atendimento where codigo=?";
        try {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, obj.getCodAtendimento());
            if (pst.executeUpdate() > 0) {
                JOptionPane.showMessageDialog(null, "Atendimento excluído");
                return true;
            } else {
                JOptionPane.showMessageDialog(null, "Atendimento não excluído");
                return false;
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Erro de SQL:" + e.getMessage());

        }
        return false;
    }

    

}


