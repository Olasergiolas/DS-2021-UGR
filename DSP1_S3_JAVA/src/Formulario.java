public class Formulario {
    int edad;
    String descripcion;
    Prioridad prioridad;
    String dni;
    boolean encriptado;

    public Formulario(){
        prioridad = Prioridad.BAJA;
        encriptado = false;
    }

    public Formulario(int e, String des, String d){
        edad = e;
        descripcion = des;
        dni = d;
        prioridad = Prioridad.BAJA;
        encriptado = false;

    }

    public int getEdad() {
        return edad;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public Prioridad getPrioridad() {
        return prioridad;
    }

    public String getDni() {
        return dni;
    }

    public boolean isEncriptado() {
        return encriptado;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public void setEncriptado(boolean encriptado) {
        this.encriptado = encriptado;
    }

    public void setPrioridad(Prioridad prioridad) {
        this.prioridad = prioridad;
    }

    public boolean getEncryptionStatus(){return encriptado;}
}
