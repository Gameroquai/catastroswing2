/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pueblosdeespaña78;

import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import javax.swing.JOptionPane;

/**
 *
 * @author Usuario
 */
public class EscuchaRaton implements MouseListener{

    @Override
    public void mouseClicked(MouseEvent e) {
          JOptionPane.showMessageDialog(null, "clic desde escucha Raton..");
    }

    @Override
    public void mousePressed(MouseEvent e) {
        
    }

    @Override
    public void mouseReleased(MouseEvent e) {
        
    }

    @Override
    public void mouseEntered(MouseEvent e) {
       JOptionPane.showMessageDialog(null, "mouseEntered desde escucha Raton..");
    }

    @Override
    public void mouseExited(MouseEvent e) {
       JOptionPane.showMessageDialog(null, "mouseExited desde escucha Raton..");
    }
    
}
