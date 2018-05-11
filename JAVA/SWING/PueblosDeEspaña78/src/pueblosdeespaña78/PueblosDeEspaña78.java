/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pueblosdeespaña78;

import java.awt.BorderLayout;
import java.awt.HeadlessException;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.DefaultComboBoxModel;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTabbedPane;
import utils78.OperaBD;

public class PueblosDeEspaña78 extends JFrame implements ItemListener{

   JComboBox    ComboComunidad,Comboprovincia;
   JTabbedPane  pestañas;
   JPanel       pueblos,municipales,mapa;
   static OperaBD      operaBD;
   
    public static void main(String[] args) {
        operaBD= new OperaBD("jdbc:oracle:thin:@localhost:1521:XE",
                                          "oracle.jdbc.driver.OracleDriver",
                                          "catastro","catastro");
        
        new PueblosDeEspaña78("Pueblos de España");
    }

    public PueblosDeEspaña78(String title) throws HeadlessException {
        super(title);
        
         pestañas    = new JTabbedPane();
         pueblos     = new JPanel(new BorderLayout());
         municipales = new JPanel(new BorderLayout());
         mapa        = new JPanel(new BorderLayout());
        /*JPanel      pinferior   = new JPanel();
        mapa.add(pinferior, BorderLayout.SOUTH);*/
        
        pestañas.addTab("Pueblos...", pueblos);
        pestañas.addTab("municipales...", municipales);
        pestañas.addTab("mapa...", mapa);
        
        
        añadeComponentesPueblos();
        this.setContentPane(pestañas);
        
        this.setVisible(true);
        this.setSize(600, 600);
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        this.setLocationRelativeTo(null);
        
        
    }// consturctor....
    void añadeComponentesPueblos(){
         //----- Pestaña Pueblos...............................................
         //--- Norte............
        JLabel comunidad = new JLabel("Comunidad->");
        ComboComunidad = new JComboBox();
        ComboComunidad.addItemListener(this);
        cargaCombo(ComboComunidad);
        /*CargaComboOracle (ComboComunidad);
        ComboComunidad.addActionListener(this);*/
        
        JLabel provincia = new JLabel("Provincias->");
        Comboprovincia = new JComboBox();
                
        JPanel nortePueblos = new JPanel();
        nortePueblos.add(comunidad);nortePueblos.add(ComboComunidad);
        nortePueblos.add(provincia);nortePueblos.add(Comboprovincia);
        
        pueblos.add(nortePueblos,BorderLayout.NORTH);
        
         //--- Centro Pueblos......................................
        final JScrollPane listaPueblos = new JScrollPane();
        pueblos.add(listaPueblos, BorderLayout.CENTER);
        
        //pestañas.addTab("Pueblos...", pueblos);
    }//añadeComponentesPueblos
    void cargaCombo(JComboBox combo){
        
       try {
           ResultSet comu=operaBD.lanzaSql("select * from comunidades");
           
           while(comu.next()){
               //combo.addItem(comu.getString("nombre"));
               combo.addItem(new Comunidades(comu.getString("nombre"),comu.getString("codigo")));
           }
       } catch (SQLException ex) {
           System.out.println("Error cargando el combo ->"+ex);
       }
        
    }
//-------------------------------------------------
    void cargaComboProv(JComboBox combo,String abr){
        
       try {
           ResultSet prov=operaBD.lanzaSql("select * from provincias "+
                                            "where comunidad='"+abr+"'");
           //combo.removeAllItems();
           combo.setModel(new DefaultComboBoxModel());
           while(prov.next()){
               combo.addItem(prov.getString("provincia"));
               //combo.addItem(new Comunidades(comu.getString("nombre"),comu.getString("codigo")));
           }
       } catch (SQLException ex) {
           System.out.println("Error cargando el combo ->"+ex);
       }
    }
//-------------------------------------------------    
    @Override
    public void itemStateChanged(ItemEvent e) {
        Comunidades comu;
        if(e.getStateChange()==ItemEvent.SELECTED){
            if(e.getSource()==ComboComunidad){
                comu=(Comunidades)ComboComunidad.getSelectedItem();
                cargaComboProv(Comboprovincia,comu.getCodigo());
            }
        }
    }//isch...
    
}
