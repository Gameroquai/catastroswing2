<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="/">
        <html>
            <head>
                <link href="boletin1.css" rel="stylesheet"/>
            </head>
            <body>
                <xsl:for-each select="//ALUMNO">
                    <xsl:sort select="C_NUMESCOLAR"/>
                    <xsl:variable name="alumnoCodigo" select="C_NUMESCOLAR"/>
                    <xsl:variable name="alumno" select="concat(C_NUMESCOLAR,' Alumno: ',T_APELLIDO1,' ',T_APELLIDO2,', ',T_NOMBRE_ALU)"/>
                
                <table border="1">
                 
                    <tr>
                        <td><xsl:attribute name="class">
                            <xsl:text>a1</xsl:text>
                        </xsl:attribute><xsl:value-of select="$alumno"/></td>
                    </tr>
                    
                    <tr>
                        <td><xsl:attribute name="class">
                            <xsl:text>a2</xsl:text>
                        </xsl:attribute>
                            Datos Personales</td>
                    </tr>
                    
                    <tr>
                        <td>
                            <ol>
                                <xsl:variable name="datos" select='document("datos_alumnos.xml")//ROW[NIE=current()/C_NUMESCOLAR]'/>
                                <li>DIRECCIÓN: <xsl:value-of select="$datos/DIRECCION"/></li>
                                <li>LOCALIDAD: <xsl:value-of select="$datos/LOCALIDAD"/></li>
                                <li>SEXO: <xsl:value-of select="$datos/SEXO"/></li>
                            </ol>
                        </td>
                    </tr>
                    
                    <tr>
                        <td><xsl:attribute name="class">
                            <xsl:text>a2</xsl:text>
                        </xsl:attribute>
                            Datos Académicos
                        </td>
                    </tr>
                    
                    <tr>
                        <td><xsl:attribute name="class">
                            <xsl:text>a3</xsl:text>
                        </xsl:attribute>
                            Notas</td>
                    </tr>
                    
                    <tr>
                        <th>Módulo</th>
                    </tr>
                    
                    <tr>
                        <td>                        
                            <select><xsl:for-each select="MATERIAS_ALUMNO/MATERIA_ALUMNO">
                                <xsl:variable name="pos" select="position()"/>
                                <xsl:variable name="codAsig" select="X_MATERIAOMG"/>
                                <xsl:variable name="notaAlum" select="X_CALIFICA"/>
                                <xsl:variable name="asignaturas" select="/SERVICIO/CURSOS/CURSO/UNIDADES/UNIDAD/MATERIAS/MATERIA[X_MATERIAOMG=$codAsig]/D_MATERIAC"/>
                                <xsl:variable name="notas" select="/SERVICIO/SISTEMAS_CALIFICACION/SISTEMA_CALIFICACION/CALIFICACIONES/CALIFICACION[X_CALIFICA=$notaAlum]/T_ABREV"/>
                                <option><xsl:value-of select="concat($pos,'--',$asignaturas,' ---- ',$notas)"/></option>
                            </xsl:for-each></select>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                            <select>
                                
                                    <!-- <xsl:variable name="datos" select="document('1DAW_FAltas_18.xml')//ALUMNO[C_NUMESCOLAR=current()/C_NUMESCOLAR]"/>
                                    <xsl:for-each select="$datos/FALTAS_ASISTENCIA/FALTA_ASISTENCIA">
                                        
                                        <option><xsl:value-of select="concat(F_FALASI,'-',C_TIPFAL)"/></option> 
                                        
                                    </xsl:for-each> -->
                              <xsl:call-template name="pintarFaltas">
                                  <xsl:with-param name="codigoAlumno" select="$alumnoCodigo"></xsl:with-param>
                              </xsl:call-template>
                            </select>
                        </td>
                    </tr>
                  
                </table>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
    
     <xsl:template name="pintarFaltas">
        <xsl:param name="codigoAlumno"/>
        <xsl:variable name="datos" select="document('1DAW_FAltas_18.xml')//ALUMNO[C_NUMESCOLAR=$codigoAlumno]"/>
        <xsl:for-each select="$datos/FALTAS_ASISTENCIA/FALTA_ASISTENCIA">
            <option>
                <xsl:attribute name="class">
                    
                    <xsl:if test="C_TIPFAL = 'I'">
                        <xsl:text>IN</xsl:text>
                    </xsl:if>
                    <xsl:if test="C_TIPFAL = 'J'">
                        <xsl:text>JU</xsl:text>
                    </xsl:if>
                    <xsl:if test="C_TIPFAL = 'R'">
                        <xsl:text>R</xsl:text>
                    </xsl:if>
                </xsl:attribute>
                <xsl:value-of select="concat(F_FALASI,'-',C_TIPFAL)"/></option>
        </xsl:for-each>
            
    </xsl:template>
</xsl:stylesheet>