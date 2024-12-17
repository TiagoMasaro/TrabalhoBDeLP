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

public class AgendamentoDao {

    MedicoDao medicoDao = new MedicoDao();
    PacientesDao pacienteDao = new PacientesDao();

    public List<Agendamento> getLista() {
        String sql = "select * from agendamentos";
        List<Agendamento> lista = new ArrayList<>();
        try {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Agendamento obj = new Agendamento();
                obj.setCodigo(rs.getInt("codAgendamentos"));
                obj.setDatahora(rs.getString("dataHora"));

                obj.setObjMedico(medicoDao.localizar(rs.getInt("medicos_codMedico")));
                obj.setObjPaciente(pacienteDao.localizar(rs.getInt("pacientes_codPaciente")));

                lista.add(obj);
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Erro de SQL no getLista()" + e.getMessage());
        }
        return lista;
    }

    public boolean salvar(Agendamento obj) {
        if (obj.getCodigo() == null) {
            return incluir(obj);
        } else {
            return alterar(obj);
        }

    }

    public boolean incluir(Agendamento obj) {
        String sql = "insert into agendamentos (dataHora, pacientes_codPaciente, medicos_codMedico) values(?,?,?)";
        try {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);

            pst.setString(1, obj.getDatahora());
            pst.setInt(2, obj.getObjPaciente().getCodigo());
            pst.setInt(3, obj.getObjMedico().getCodMedico());

            if (pst.executeUpdate() > 0) {
                JOptionPane.showMessageDialog(null, "Agendamento realizado!");
                return true;
            } else {
                JOptionPane.showMessageDialog(null, "Agendamento não realizado!");
                return false;
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Erro de SQL: " + e.getMessage());

        }
        return false;
    }

    public boolean alterar(Agendamento obj) {
        String sql = "update agendamentos set pacientes_codPaciente=?, medicos_codMedico=?, dataHora=? where codAgendamentos=?";
        try {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);

            pst.setString(1, obj.getDatahora());
            pst.setInt(2, obj.getObjPaciente().getCodigo());
            pst.setInt(3, obj.getObjMedico().getCodMedico());

            if (pst.executeUpdate() > 0) {
                JOptionPane.showMessageDialog(null, "Agendamento alterado");
                return true;
            } else {
                JOptionPane.showMessageDialog(null, "Agendamento não alterado");
                return false;
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Erro de SQL:" + e.getMessage());

        }
        return false;
    }

    public boolean remover(Agendamento obj) {
        String sql = "delete from agendamentos where codigo=?";
        try {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, obj.getCodigo());
            if (pst.executeUpdate() > 0) {
                JOptionPane.showMessageDialog(null, "Agendamento excluído");
                return true;
            } else {
                JOptionPane.showMessageDialog(null, "Agendamento não excluído");
                return false;
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Erro de SQL:" + e.getMessage());

        }
        return false;
    }

}
