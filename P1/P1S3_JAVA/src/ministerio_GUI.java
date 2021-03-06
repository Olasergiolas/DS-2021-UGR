/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author sergiogarcia
 */

public class ministerio_GUI extends javax.swing.JFrame {

    private Target target;
    private String despacho_citas;
    
    /**
     * Creates new form ministerio_GUI
     */
    public ministerio_GUI() {
        initComponents();
    }

    public void setTarget(Target t){
        target = t;
    }
    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        encriptados = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        dni_en = new javax.swing.JTextField();
        ldni_en = new javax.swing.JLabel();
        ledad_en = new javax.swing.JLabel();
        lprioridad_en = new javax.swing.JLabel();
        ldescr_en = new javax.swing.JLabel();
        edad_en = new javax.swing.JTextField();
        prioridad_en = new javax.swing.JTextField();
        descripcion_en = new javax.swing.JTextField();
        desencriptados = new javax.swing.JPanel();
        jLabel2 = new javax.swing.JLabel();
        ldni_des = new javax.swing.JLabel();
        ledad_des = new javax.swing.JLabel();
        lprioridad_des = new javax.swing.JLabel();
        ldescripcion_des = new javax.swing.JLabel();
        dni_des = new javax.swing.JTextField();
        edad_des = new javax.swing.JTextField();
        prioridad_des = new javax.swing.JTextField();
        descripcion_des = new javax.swing.JTextField();
        citas = new javax.swing.JPanel();
        jLabel3 = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        texto_citas = new javax.swing.JTextArea();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        encriptados.setBorder(javax.swing.BorderFactory.createEtchedBorder());

        jLabel1.setText("Formularios encriptados:");

        dni_en.setText("jTextField1");
        dni_en.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                dni_enActionPerformed(evt);
            }
        });

        ldni_en.setText("DNI:");

        ledad_en.setText("Edad:");

        lprioridad_en.setText("Prioridad:");

        ldescr_en.setText("Descripci??n:");

        edad_en.setText("jTextField2");

        prioridad_en.setText("jTextField3");

        descripcion_en.setText("jTextField4");

        javax.swing.GroupLayout encriptadosLayout = new javax.swing.GroupLayout(encriptados);
        encriptados.setLayout(encriptadosLayout);
        encriptadosLayout.setHorizontalGroup(
            encriptadosLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(encriptadosLayout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel1)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
            .addGroup(encriptadosLayout.createSequentialGroup()
                .addGap(49, 49, 49)
                .addGroup(encriptadosLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(ldescr_en)
                    .addComponent(lprioridad_en)
                    .addComponent(ledad_en)
                    .addComponent(ldni_en))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 283, Short.MAX_VALUE)
                .addGroup(encriptadosLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(dni_en, javax.swing.GroupLayout.DEFAULT_SIZE, 173, Short.MAX_VALUE)
                    .addComponent(edad_en)
                    .addComponent(prioridad_en)
                    .addComponent(descripcion_en))
                .addContainerGap())
        );
        encriptadosLayout.setVerticalGroup(
            encriptadosLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(encriptadosLayout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel1)
                .addGap(18, 18, 18)
                .addGroup(encriptadosLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(dni_en, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(ldni_en))
                .addGap(18, 18, 18)
                .addGroup(encriptadosLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(ledad_en)
                    .addComponent(edad_en, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(encriptadosLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(lprioridad_en)
                    .addComponent(prioridad_en, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(encriptadosLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(ldescr_en)
                    .addComponent(descripcion_en, javax.swing.GroupLayout.PREFERRED_SIZE, 67, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(106, Short.MAX_VALUE))
        );

        desencriptados.setBorder(javax.swing.BorderFactory.createEtchedBorder());

        jLabel2.setText("Formularios desencriptados:");

        ldni_des.setText("DNI:");

        ledad_des.setText("Edad:");

        lprioridad_des.setText("Prioridad:");

        ldescripcion_des.setText("Descripci??n:");

        dni_des.setText("jTextField5");

        edad_des.setText("jTextField6");

        prioridad_des.setText("jTextField7");

        descripcion_des.setText("jTextField8");

        javax.swing.GroupLayout desencriptadosLayout = new javax.swing.GroupLayout(desencriptados);
        desencriptados.setLayout(desencriptadosLayout);
        desencriptadosLayout.setHorizontalGroup(
            desencriptadosLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(desencriptadosLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(desencriptadosLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel2)
                    .addGroup(desencriptadosLayout.createSequentialGroup()
                        .addGap(49, 49, 49)
                        .addGroup(desencriptadosLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(lprioridad_des)
                            .addGroup(desencriptadosLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                                .addComponent(ledad_des)
                                .addComponent(ldni_des))
                            .addComponent(ldescripcion_des))))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 243, Short.MAX_VALUE)
                .addGroup(desencriptadosLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(dni_des, javax.swing.GroupLayout.DEFAULT_SIZE, 149, Short.MAX_VALUE)
                    .addComponent(edad_des)
                    .addComponent(prioridad_des)
                    .addComponent(descripcion_des))
                .addContainerGap())
        );
        desencriptadosLayout.setVerticalGroup(
            desencriptadosLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(desencriptadosLayout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel2)
                .addGap(18, 18, 18)
                .addGroup(desencriptadosLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(ldni_des)
                    .addComponent(dni_des, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(desencriptadosLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(ledad_des)
                    .addComponent(edad_des, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(desencriptadosLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(lprioridad_des)
                    .addComponent(prioridad_des, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(desencriptadosLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(ldescripcion_des)
                    .addComponent(descripcion_des, javax.swing.GroupLayout.PREFERRED_SIZE, 72, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        citas.setBorder(javax.swing.BorderFactory.createEtchedBorder());

        jLabel3.setText("Citas:");

        texto_citas.setColumns(20);
        texto_citas.setRows(5);
        jScrollPane1.setViewportView(texto_citas);

        javax.swing.GroupLayout citasLayout = new javax.swing.GroupLayout(citas);
        citas.setLayout(citasLayout);
        citasLayout.setHorizontalGroup(
            citasLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(citasLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(citasLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(citasLayout.createSequentialGroup()
                        .addGap(12, 12, 12)
                        .addComponent(jScrollPane1))
                    .addGroup(citasLayout.createSequentialGroup()
                        .addComponent(jLabel3)
                        .addGap(0, 0, Short.MAX_VALUE)))
                .addContainerGap())
        );
        citasLayout.setVerticalGroup(
            citasLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(citasLayout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel3)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 144, Short.MAX_VALUE)
                .addContainerGap())
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(32, 32, 32)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(encriptados, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(desencriptados, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                    .addComponent(citas, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addGap(34, 34, 34))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(encriptados, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(desencriptados, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(citas, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void dni_enActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_dni_enActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_dni_enActionPerformed

    public void setText(){
        Formulario formulario_encriptado = target.getFormularioEncriptado();
        Formulario formulario_desencriptado = target.getFormularioDesencriptado();
        
        dni_en.setText(formulario_encriptado.getDni());
        edad_en.setText(Integer.toString(formulario_encriptado.getEdad()));
        descripcion_en.setText(formulario_encriptado.getDescripcion());
        prioridad_en.setText(formulario_encriptado.getPrioridad().name());
        
        dni_des.setText(formulario_desencriptado.getDni());
        edad_des.setText(Integer.toString(formulario_desencriptado.getEdad()));
        descripcion_des.setText(formulario_desencriptado.getDescripcion());
        prioridad_des.setText(formulario_desencriptado.getPrioridad().name());
        
        despacho_citas = target.citaToString();
        
        if(despacho_citas != ""){
            texto_citas.setText(despacho_citas);
        }
    }
    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(ministerio_GUI.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(ministerio_GUI.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(ministerio_GUI.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(ministerio_GUI.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new ministerio_GUI().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JPanel citas;
    private javax.swing.JTextField descripcion_des;
    private javax.swing.JTextField descripcion_en;
    private javax.swing.JPanel desencriptados;
    private javax.swing.JTextField dni_des;
    private javax.swing.JTextField dni_en;
    private javax.swing.JTextField edad_des;
    private javax.swing.JTextField edad_en;
    private javax.swing.JPanel encriptados;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JLabel ldescr_en;
    private javax.swing.JLabel ldescripcion_des;
    private javax.swing.JLabel ldni_des;
    private javax.swing.JLabel ldni_en;
    private javax.swing.JLabel ledad_des;
    private javax.swing.JLabel ledad_en;
    private javax.swing.JLabel lprioridad_des;
    private javax.swing.JLabel lprioridad_en;
    private javax.swing.JTextField prioridad_des;
    private javax.swing.JTextField prioridad_en;
    private javax.swing.JTextArea texto_citas;
    // End of variables declaration//GEN-END:variables
}
