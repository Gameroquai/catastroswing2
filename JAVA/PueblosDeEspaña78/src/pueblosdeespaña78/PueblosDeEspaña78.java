/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pueblosdeespaña78;

import java.awt.BorderLayout;
import java.awt.HeadlessException;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.DefaultComboBoxModel;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JSplitPane;
import javax.swing.JTabbedPane;
import javax.swing.JTable;
import javax.swing.RowFilter;
import javax.swing.RowSorter;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableModel;
import javax.swing.table.TableRowSorter;
import utils78.OperaBD;

public class PueblosDeEspaña78 extends JFrame implements ItemListener, ActionListener{

   JComboBox    ComboComunidad,Comboprovincia;
   JTabbedPane  pestañas;
   JPanel       pueblos,municipales,mapa;
   JScrollPane  listaPueblos,listaMunicipales,html;
   JSplitPane   splitMunicipales;
   JTable       tablaPueblos,tablaMunicipales;
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
        JLabel provincia = new JLabel("Provincias->");
        Comboprovincia = new JComboBox();
        
        
        //ComboComunidad.addItemListener(this);
        ComboComunidad.addActionListener(this);
        cargaCombo(ComboComunidad);
        
        Comboprovincia.addItemListener(this);
        /*CargaComboOracle (ComboComunidad);
        ComboComunidad.addActionListener(this);*/
               
        JPanel nortePueblos = new JPanel();
        nortePueblos.add(comunidad);nortePueblos.add(ComboComunidad);
        nortePueblos.add(provincia);nortePueblos.add(Comboprovincia);
        
        pueblos.add(nortePueblos,BorderLayout.NORTH);
        
         //--- Centro Pueblos......................................
        listaPueblos = new JScrollPane();
        pueblos.add(listaPueblos, BorderLayout.CENTER);
        
        tablaPueblos=cargaTablaBd("Select * from poblaciones");
        
        tablaPueblos.addMouseListener(new MouseAdapter(){
        
            @Override
        public void mouseClicked(MouseEvent e) {
          //JOptionPane.showMessageDialog(null, "clic desde MouseAdapter.. en "+ e.getSource());
           int fila=((JTable)e.getSource()).getSelectedRow();
           String pueblo = (String)((JTable)e.getSource()).getValueAt(fila,2);
           JOptionPane.showMessageDialog(null,"Pueblo-> "+pueblo);
           
           TableRowSorter ordenaMuni = new TableRowSorter();
           
           ordenaMuni.setRowFilter(RowFilter.regexFilter(pueblo, 3)); 
           tablaMunicipales.setRowSorter(ordenaMuni);
           }      
            
        });
        
        
        
        listaPueblos.setViewportView(tablaPueblos);
        
        // Pestaña Municipales..............
        splitMunicipales= new JSplitPane(JSplitPane.VERTICAL_SPLIT);
        tablaMunicipales=cargaTablaFichero("municipales.txt");
        
        listaMunicipales = new JScrollPane();
        html = new JScrollPane();
        listaMunicipales.setViewportView(tablaMunicipales);
        splitMunicipales.add(listaMunicipales, JSplitPane.TOP);
        splitMunicipales.add(html, JSplitPane.BOTTOM);
        
        municipales.add(splitMunicipales, BorderLayout.CENTER);
       
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
           ResultSet prov=operaBD.lanzaSql("select idprovincia,provincia from provincias "+
                                            "where comunidad='"+abr+"'");
           //combo.removeAllItems();
           combo.setModel(new DefaultComboBoxModel());
           while(prov.next()){
               combo.addItem(new Provincias2(prov.getBigDecimal("idprovincia"),
                                             prov.getString("provincia") ) );
           }
       } catch (SQLException ex) {
           System.out.println("Error cargando el combo ->"+ex);
       }
    }
//-------------------------------------------------    
    @Override
    public void itemStateChanged(ItemEvent e) {
        BigDecimal prov=((Provincias2)Comboprovincia.getSelectedItem()).getIdprovincia();
        TableRowSorter elQueOrdena=(TableRowSorter) tablaPueblos.getRowSorter();
        elQueOrdena.setRowFilter(RowFilter.numberFilter(RowFilter.ComparisonType.EQUAL, prov, 1));

        
        //String consulta="select * from poblaciones where idprovincia="+prov;
        //listaPueblos.setViewportView(cargaTablapueblos(consulta));
      /*  if(e.getStateChange()==ItemEvent.SELECTED){
            if(e.getSource()==ComboComunidad){*/
             //   comu=(Comunidades)ComboComunidad.getSelectedItem();
             //   cargaComboProv(Comboprovincia,comu.getCodigo());
          //  }
        //}
    }//isch...

    @Override
    public void actionPerformed(ActionEvent e) {
        Comunidades comu;
        comu=(Comunidades)ComboComunidad.getSelectedItem();
                cargaComboProv(Comboprovincia,comu.getCodigo());
        
    }
   //--------------------------------------------- 
   JTable cargaTablaBd(String consulta){
           //String consulta="select * from poblaciones";
           int numColumns=0;
           JTable tabla=null;
       try {
           
           ResultSet rs = operaBD.lanzaSql(consulta);
           ResultSetMetaData rsm= rs.getMetaData();
           numColumns = rsm.getColumnCount();
                      
           Object[] columnNames = new Object[numColumns];
           
           for(int i=0;i<numColumns;i++)
               columnNames[i]=rsm.getColumnLabel(i+1);
           
           DefaultTableModel dtm = new DefaultTableModel(columnNames, 0);
           
           //cargamos los datos de las filas...........
           while(rs.next()){
              Object[] fila = new Object[numColumns];
              for(int i=0;i<numColumns;i++){
                  fila[i]=rs.getObject(i+1);
              }
              dtm.addRow(fila);
           }
           
            tabla = new JTable(dtm);
            
            // Instanciamos el TableRowSorter y lo añadimos al JTable
         TableRowSorter elQueOrdena = new TableRowSorter(dtm);
         tabla.setRowSorter(elQueOrdena);
           
           
       } catch (SQLException ex) {
           System.out.println("Error al cargar la TAbla->  "+ ex);
           
       }finally{
           return tabla;
       }
    }//creaTAbla...
   //---------------------------------------------
   JTable cargaTablaFichero(String fichero){
       FileReader fr=null;  BufferedReader br; 
       String linea,fila[];
       JTable tabla=null;
       
       try {
           
           fr =  new FileReader("src/datos/"+fichero);
           br =  new BufferedReader(fr);
           
           //linea = br.readLine();
           fila  = br.readLine().split(";");
           
           DefaultTableModel dtm = new DefaultTableModel(fila, 0);
           
           tabla = new JTable(dtm);
           
           fila  = br.readLine().split(";");
           
           while(fila!=null){
               dtm.addRow(fila);
               fila  = br.readLine().split(";");
           }
           
           
           //return tabla;
           
           
       } catch (FileNotFoundException ex) {
           System.out.println("nose encuentra el fichero: "+fichero+" -> "+ex);
       } catch (IOException ex) {
           Logger.getLogger(PueblosDeEspaña78.class.getName()).log(Level.SEVERE, null, ex);
       } finally {
           
           try {
               
               fr.close();
               
           } catch (IOException ex) {
               System.out.println("Error al cerrar el fichero....");
           }
           return tabla;
       }
    }// cargaTablaFich....
     
}//class
