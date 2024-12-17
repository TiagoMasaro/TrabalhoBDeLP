/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.util.Calendar;
import java.util.Objects;

/**
 *
 * @author victo
 */
public class Atendimento {
    
    private Integer codAtendimento;
    private Calendar dataPagamento, dataAtendimento;
    private String tipoPagamento;
    private Medico objMedico;
    private Pacientes objPaciente;

    public Integer getCodAtendimento() {
        return codAtendimento;
    }

    public void setCodAtendimento(Integer codAtendimento) {
        this.codAtendimento = codAtendimento;
    }

    public Calendar getDataPagamento() {
        return dataPagamento;
    }

    public void setDataPagamento(Calendar dataPagamento) {
        this.dataPagamento = dataPagamento;
    }

    public Calendar getDataAtendimento() {
        return dataAtendimento;
    }

    public void setDataAtendimento(Calendar dataAtendimento) {
        this.dataAtendimento = dataAtendimento;
    }

    public String getTipoPagamento() {
        return tipoPagamento;
    }

    public void setTipoPagamento(String tipoPagamento) {
        this.tipoPagamento = tipoPagamento;
    }

    public Medico getObjMedico() {
        return objMedico;
    }

    public void setObjMedico(Medico objMedico) {
        this.objMedico = objMedico;
    }

    public Pacientes getObjPaciente() {
        return objPaciente;
    }

    public void setObjPaciente(Pacientes objPaciente) {
        this.objPaciente = objPaciente;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Atendimento other = (Atendimento) obj;
        if (!Objects.equals(this.tipoPagamento, other.tipoPagamento)) {
            return false;
        }
        if (!Objects.equals(this.codAtendimento, other.codAtendimento)) {
            return false;
        }
        if (!Objects.equals(this.dataPagamento, other.dataPagamento)) {
            return false;
        }
        if (!Objects.equals(this.dataAtendimento, other.dataAtendimento)) {
            return false;
        }
        if (!Objects.equals(this.objMedico, other.objMedico)) {
            return false;
        }
        if (!Objects.equals(this.objPaciente, other.objPaciente)) {
            return false;
        }
        return true;
    }
    
    
    
}
