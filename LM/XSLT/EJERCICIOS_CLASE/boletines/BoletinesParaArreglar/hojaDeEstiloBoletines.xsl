<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0">
    <xsl:template match="/">
        
        <html>
            <body>
                <h1>Grupo:  <xsl:value-of select="/SERVICIO/CURSOS/CURSO/UNIDADES/UNIDAD/T_NOMBRE"/></h1>
                <xsl:for-each select="//ALUMNO">
                    <!-- Declaracion de varibles -->
                    <xsl:variable name="nombreAlumnoCompleto" select="concat('Alumno: ', T_APELLIDO1,' ',T_APELLIDO2,' ',T_NOMBRE_ALU)"/>
                    <xsl:variable name="nom"/>
                    <table><xsl:attribute name="border">1</xsl:attribute>
                        <tr>
                            <td> <xsl:attribute name="colspan">3</xsl:attribute><xsl:value-of select="$nombreAlumnoCompleto"/></td>
                        </tr>
                        <tr><xsl:attribute name="class">dp</xsl:attribute>
                            
                            <td><xsl:attribute name="colspan">3</xsl:attribute>DATOS PERSONALES</td></tr>
                        <tr><td><xsl:attribute name="colspan">3</xsl:attribute>
                            <ul>
                                <li>Direccion:</li>
                                <li>Localidad:</li>
                                <li>Sexo:</li>
                            </ul>
                        </td>
                        </tr>
                        <tr><xsl:attribute name="class">da</xsl:attribute>
                           
                            <td> <xsl:attribute name="colspan">3</xsl:attribute>Datos Académicos</td>
                        </tr>
                        <tr><xsl:attribute name="class">notas</xsl:attribute>
                            <td><xsl:attribute name="colspan">3</xsl:attribute>Notas</td>
                        </tr>
                        <tr>
                        <td>Modulo</td>
                        <td>EVA1</td>
                        <td>EVA2</td>
                        </tr>
                        <!-- Sacamos el nombre de las materias -->
                        <xsl:for-each select="MATERIAS_ALUMNO/MATERIA_ALUMNO">
                            <xsl:variable name="codMateria" select="X_MATERIAOMG"/>
                            <xsl:variable name="calificacion" select="X_CALIFICA"/>
                            <xsl:for-each select="//UNIDAD/MATERIAS/MATERIA[X_MATERIAOMG=$codMateria]">
                                <xsl:variable name="nombreMateria" select="D_MATERIAC"/>
                                <xsl:variable name="codNota" select="X_SISTCAL"/>
                                
                                <tr>
                                    <td><xsl:value-of select="$nombreMateria"/></td>
                                    <!-- Sacamos las notas -->
                                    <xsl:for-each select="//SISTEMA_CALIFICACION[X_SISTCAL=$codNota]/CALIFICACIONES[1]/CALIFICACION/D_CALIFICA[X_CALIFICA=$calificacion]">
                                        <td><xsl:value-of select="."/></td>
                                    </xsl:for-each>
                                </tr>
                            </xsl:for-each>
                            
                        </xsl:for-each>
                        <!--**********************************************************-->
                    </table>
                    <!-- DATOS PERSONALES --><!--
                    <xsl:variable name="direccionAlu" select=""/>
                    <xsl:variable name="localidadAlu" select=""/>
                    <xsl:variable name="sexoAlu" select=""/>-->
                    
                    <!-- DATOS ACADEMICOS -->
                </xsl:for-each>
                
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>