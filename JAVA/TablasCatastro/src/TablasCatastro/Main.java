package TablasCatastro;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class Main {

    public static void main(String[] args) {

    cargarTabla(new JTable(),"comunidades");

    }

    static void cargarTabla(JTable tablaj, String tablabd){

        ConectaBD conectaBD = new ConectaBD();

        ResultSet resultSet = conectaBD.ejecutarConsulta("select * from "+tablabd);

        //columnas


        try {
            int columnCount = resultSet.getMetaData().getColumnCount();
            DefaultTableModel tableModel = new DefaultTableModel();

            for (int i = 1; i <=columnCount ; i++) {

                String columnName = resultSet.getMetaData().getColumnName(i);

                tableModel.addColumn(columnName);
            }

            //filas

            Vector filas = new Vector();

            while(resultSet.next()){

                for (int i = 1; i <=columnCount ; i++) {
                    Object datoFila = resultSet.getObject(i);
                    filas.add(datoFila);
                }
                tableModel.addRow(filas);
            }

            for (int i = 0; i <filas.size() ; i++) {
                System.out.println(filas.get(i));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
