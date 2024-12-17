/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.util.Objects;

/**
 *
 * @author victo
 */
public class Agendamento {
    
    private Integer codigo;
    private String datahora;
    private Medico objMedico;
    private Pacientes objPaciente;

    public String getDatahora() {
        return datahora;
    }

    public void setDatahora(String datahora) {
        this.datahora = datahora;
    }

    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
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
        int hash = 7;
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
        final Agendamento other = (Agendamento) obj;
        if (!Objects.equals(this.datahora, other.datahora)) {
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
