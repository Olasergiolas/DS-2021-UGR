public class Cita {
    String dni;
    int dia;
    int hora;

    public Cita(int d, int h){
        dia = d;
        hora = h;
    }

    public String getDni() {
        return dni;
    }

    public int getDia() {
        return dia;
    }

    public int getHora() {
        return hora;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public void setDia(int dia) {
        this.dia = dia;
    }

    public void setHora(int hora) {
        this.hora = hora;
    }
}
