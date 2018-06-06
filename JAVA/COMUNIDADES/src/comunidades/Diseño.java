/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package comunidades;

import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.DefaultCellEditor;
import javax.swing.JComboBox;
import javax.swing.JOptionPane;
import javax.swing.RowFilter;
import javax.swing.RowSorter;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumn;
import javax.swing.table.TableModel;
import javax.swing.table.TableRowSorter;

/**
 *
 * @author usuario
 */
public class Diseño extends javax.swing.JFrame {

    String comboPobSel;
    /**
     * Creates new form Diseño
     */
    public Diseño() {
        initComponents();
        ConectaBD bD = new ConectaBD();
        DefaultTableModel tableModel = bD.tableModel("comunidades");
        tablaComunidades.setModel(tableModel);
        
        TableRowSorter rowSorter = new TableRowSorter(tableModel);
        tablaComunidades.setRowSorter(rowSorter);
        
        DefaultTableModel tableModelProv = bD.tableModel("Provincias");
        TableRowSorter rowSorter1 = new TableRowSorter(tableModelProv);
        tableModelProv.addColumn("Pueblo");
        tablaProvincias.setModel(tableModelProv);
        tablaProvincias.setRowSorter(rowSorter1);
        
        //ComboBox--------------------------------------------------------------
        JComboBox comboPueblos = new JComboBox();
        TableColumn colPueblos = tablaProvincias.getColumnModel().getColumn(6);
        //setCellEditor(new DefaultCellEditor(myComboBox)
        colPueblos.setCellEditor(new DefaultCellEditor(comboPueblos));
        
        
        

        tablaComunidades.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                super.mouseClicked(e); //To change body of generated methods, choose Tools | Templates.
                
                String value = (String)tablaComunidades.getValueAt(tablaComunidades.getSelectedRow(), 1);
                rowSorter1.setRowFilter(RowFilter.regexFilter(value,0));
               // jTable2.setRowSorter(rowSorter1);
            }

        });
        
        tablaProvincias.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                super.mouseClicked(e); //To change body of generated methods, choose Tools | Templates.
                comboPueblos.removeAllItems();
                String selecProv = (String) tablaProvincias.getValueAt(tablaProvincias.getSelectedRow(), 1);
                ResultSet sacarPueblo = bD.ejecutarConsulta("select poblacionseo from poblaciones where idprovincia = "+selecProv);
                try {
                    while(sacarPueblo.next()){
                        comboPueblos.addItem(sacarPueblo.getString(1));
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(Diseño.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        });
        
        /*comboPueblos.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                super.mouseClicked(e); //To change body of generated methods, choose Tools | Templates.
                String selectID = (String) tablaProvincias.getValueAt(tablaProvincias.getSelectedRow(), 1);
                //System.out.println(selectID);
                comboPueblos.removeAllItems();
                ResultSet sacarPueblo = bD.ejecutarConsulta("select poblacionseo from poblaciones where idprovincia = "+selectID);
                try {
                    while(sacarPueblo.next()){
                        comboPueblos.addItem(sacarPueblo.getString(1));
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(Diseño.class.getName()).log(Level.SEVERE, null, ex);
                }
                comboPobSel = (String) comboPueblos.getSelectedItem();
                System.out.println(comboPobSel);
                ResultSet ejecutarConsulta = bD.ejecutarConsulta("select * from poblaciones where poblacionseo = "+comboPobSel);
                try {
                    while(ejecutarConsulta.next()){
                        cpLabel.setText(ejecutarConsulta.getString(1));
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(Diseño.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        });*/
        
        comboPueblos.addItemListener(new ItemListener() {
            @Override
            public void itemStateChanged(ItemEvent e) {
                
            }
        });
        
        
        
        
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        tablaComunidades = new javax.swing.JTable();
        jLabel2 = new javax.swing.JLabel();
        jScrollPane2 = new javax.swing.JScrollPane();
        tablaProvincias = new javax.swing.JTable();
        pueblos = new javax.swing.JLabel();
        jPanel1 = new javax.swing.JPanel();
        cpLabel = new javax.swing.JLabel();
        nombreLabel = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jLabel1.setText("COMUNIDADES");

        tablaComunidades.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null}
            },
            new String [] {
                "Title 1", "Title 2", "Title 3", "Title 4"
            }
        ));
        jScrollPane1.setViewportView(tablaComunidades);

        jLabel2.setText("PROVINCIAS");

        tablaProvincias.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null}
            },
            new String [] {
                "Title 1", "Title 2", "Title 3", "Title 4"
            }
        ));
        jScrollPane2.setViewportView(tablaProvincias);

        pueblos.setText("POBLACION");

        cpLabel.setText("CP: ");

        nombreLabel.setText("jLabel3");

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(nombreLabel)
                    .addComponent(cpLabel))
                .addContainerGap(114, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(nombreLabel)
                .addGap(18, 18, 18)
                .addComponent(cpLabel)
                .addContainerGap(170, Short.MAX_VALUE))
        );

        nombreLabel.getAccessibleContext().setAccessibleName("nombre");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(43, 43, 43)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 268, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 431, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel1)
                    .addComponent(jLabel2))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 52, Short.MAX_VALUE)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(pueblos)
                    .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(101, 101, 101))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(19, 19, 19)
                        .addComponent(jLabel1)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 140, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(30, 30, 30)
                        .addComponent(jLabel2)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 272, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(146, 146, 146)
                        .addComponent(pueblos)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(18, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

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
            java.util.logging.Logger.getLogger(Diseño.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Diseño.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Diseño.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Diseño.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Diseño().setVisible(true);
            }
        });
    }


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel cpLabel;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JLabel nombreLabel;
    private javax.swing.JLabel pueblos;
    private javax.swing.JTable tablaComunidades;
    private javax.swing.JTable tablaProvincias;
    // End of variables declaration//GEN-END:variables

}
