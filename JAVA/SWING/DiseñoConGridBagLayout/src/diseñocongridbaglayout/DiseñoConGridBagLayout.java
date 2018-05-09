/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package diseñocongridbaglayout;

import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.HeadlessException;
import javax.swing.*;

/**
 *
 * @author Luis Miguel Guerrero Gamero
 */
public class DiseñoConGridBagLayout extends JFrame {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
    }

    JLabel name, items, address;
    JTextArea area44;

    public DiseñoConGridBagLayout() throws HeadlessException {
        GridBagConstraints bagConstraints = new GridBagConstraints();
        this.setLayout(new GridBagLayout());
        bagConstraints.gridx = 0;
        bagConstraints.gridy = 0;
        bagConstraints.weightx = 4;
        bagConstraints.fill = GridBagConstraints.BOTH;
        
        setTitle("ventana");
        name = new JLabel("Name");
        items = new JLabel("Items");
        address = new JLabel("Address");
        area44 = new JTextArea(2, 10);

    }

}
