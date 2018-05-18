package pueblosdeespaña78;

import java.awt.event.MouseEvent;
import javax.swing.JOptionPane;
import javax.swing.JTable;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Usuario
 */
public class EscuchaRaton2 extends EscuchaRaton{
    
    @Override
    public void mouseClicked(MouseEvent e) {
         int fila=((JTable)e.getSource()).getSelectedRow();
                JOptionPane.showMessageDialog(null,"Pueblo-> "+((JTable)e.getSource()).getValueAt(fila,2));
    }
}
