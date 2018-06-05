package TablasCatastro;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import static java.awt.GridBagConstraints.LINE_START;

public class VentanaPrincipal extends JFrame {

    public static void main(String[] args) {

      
    }

    public VentanaPrincipal() throws HeadlessException {
        setSize(1920, 1080);
        setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);
        setTitle("CATASTRO");
        Container contentPane = getContentPane();
        GridBagConstraints gridBagConstraints = new GridBagConstraints();
        gridBagConstraints.gridx = 0;
        gridBagConstraints.gridy = 0;
        JLabel labelComunidades = new JLabel("COMUNIDADES");
        JPanel jPanel = new JPanel(new GridBagLayout());
        jPanel.add(labelComunidades, gridBagConstraints);
        ConectaBD conectaBD = new ConectaBD();
        DefaultTableModel tablemodelComunidades = conectaBD.tableModel("comunidades");
        JTable tablaComunidades = new JTable(tablemodelComunidades);
        JScrollPane scrollComunidades = new JScrollPane(tablaComunidades);
        gridBagConstraints.gridy = 1;
        jPanel.add(scrollComunidades,gridBagConstraints);
        contentPane.add(jPanel, BorderLayout.NORTH);

        GridBagConstraints gbc = new GridBagConstraints();
        gbc.gridx = 0;
        gbc.gridy = 0;


        JPanel panelProvincias = new JPanel(new GridBagLayout());
        JLabel labelProvincias = new JLabel("PROVINCIAS");
        DefaultTableModel modeloProvincias = conectaBD.tableModel("provincias");
        JTable tablaProvincias = new JTable(modeloProvincias);
        JScrollPane jScrollPaneProvi = new JScrollPane(tablaProvincias);
        panelProvincias.add(labelProvincias,gbc);
        gbc.gridy = 1;
        panelProvincias.add(jScrollPaneProvi, gbc);
        contentPane.add(panelProvincias,BorderLayout.CENTER);



    }
}
