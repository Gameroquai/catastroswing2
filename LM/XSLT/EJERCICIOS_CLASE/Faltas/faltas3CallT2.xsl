<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="/">
        <html>
            <head>
                <meta charset="UTF-8"/>
                <link href="estiloFaltas.css" rel="stylesheet" type="text/css"/>
                <title>Faltas</title>
            </head>
            <body>
                <xsl:variable name="totalAlum" select="count(//ALUMNO)"/>
                <xsl:value-of select="$totalAlum"/>
                <xsl:variable name="faltasT" select="count(//FALTAS_ASISTENCIA/FALTA_ASISTENCIA)"/>
                <xsl:variable name="media" select="count(//FALTA_ASISTENCIA) div $totalAlum"/>
          
                <h1>1º F.P.I.G.S. (Desarrollo de Aplicaciones Web)</h1>
                
                <p>
                    <h2>Relación de alumnos con alguna falta en el periodo de: <xsl:value-of
                        select="concat(//FECHA_DESDE, //FECHA_HASTA)"/> con al menos 
                        <xsl:value-of select="$media"/> faltas
                    </h2>
                </p>
                <table>
                    <tr>
                        <th>Alumno</th>
                        <th>Nº de Faltas</th>
                        <th>Faltas Injustificadas</th><th><xsl:value-of select="$totalAlum"/></th>
                    </tr>
                    <xsl:for-each select="//ALUMNOS/ALUMNO">
                        <xsl:sort select="T_APELLIDO_1"/>
                        <xsl:variable name="nombreCompleto" select="concat(T_APELLIDO1, T_APELLIDO2, ', ', T_NOMBRE_ALU)"/>
                      
                        <xsl:call-template name="monete">
                            <xsl:with-param name="tAlumnos" select="$totalAlum"/>
                            <xsl:with-param name="fTotales" select="$faltasT"/>
                            <xsl:with-param name="nombre" select="$nombreCompleto"/>
                        </xsl:call-template>
                    </xsl:for-each>
                </table>
                
            </body>
        </html>
    </xsl:template>
    
    <xsl:template name="monete">
        <xsl:param name="fTotales"/>
        <xsl:param name="tAlumnos"/>
        <xsl:param name="nombre"/>
        <xsl:variable name="fTotalesAlumno" select="count(FALTAS_ASISTENCIA/FALTA_ASISTENCIA)"/>
        <xsl:variable name="mediaMonete" select="$fTotales div $tAlumnos"/>
         <xsl:if test="$fTotalesAlumno &gt; 0 ">
            <tr>
                <td><xsl:value-of select="$nombre"/></td>
                <td><xsl:value-of select="$fTotalesAlumno"/></td>
                <td><xsl:value-of select="count(FALTAS_ASISTENCIA/FALTA_ASISTENCIA[C_TIPFAL='I'])"/></td>
                <td> <select>
                    <xsl:for-each select="FALTAS_ASISTENCIA/FALTA_ASISTENCIA">
                        <xsl:variable name="op" select="concat(F_FALASI, '--', C_TIPFAL)"/>
                            <option><xsl:attribute name="class">
                                <xsl:if test="C_TIPFAL='I'">
                                    <xsl:text>IN</xsl:text>
                                </xsl:if>
                            </xsl:attribute>
                                
                            <xsl:value-of select="$op"/></option>
                            
                    </xsl:for-each>
                </select></td>
            </tr>
         </xsl:if>        
        
    </xsl:template>
</xsl:stylesheet>