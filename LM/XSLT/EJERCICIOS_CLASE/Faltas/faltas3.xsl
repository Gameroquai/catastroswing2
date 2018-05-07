<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

    <xsl:template match="/">
        <html>
            <head>
                <meta charset="UTF-8"/>
                <link href="estiloFaltas.css" rel="stylesheet" type="text/css"/>
                <title>Faltas</title>
            </head>
            <body>
                
                <h1>1º F.P.I.G.S. (Desarrollo de Aplicaciones Web)</h1>
                <!-- <xsl:variable name="fechas" select="concat(servicio/datos_generales/fecha_desde' a 'servicio/datos_generales/fecha_hasta)"/> -->
               
                    <xsl:variable name="totalAlum" select="count(//ALUMNO)"/>
                    
                    <xsl:variable name="media" select="count(//FALTA_ASISTENCIA) div $totalAlum"/>
                    <h2>Relación de alumnos con alguna falta en el periodo de: <xsl:value-of
                            select="concat(//FECHA_DESDE, //FECHA_HASTA)"/> con al menos 
                        <xsl:value-of select="$media"/> faltas
                    </h2>
             
                <table>
                    <tr>
                        <th>Alumno</th>
                        <th>Nº de Faltas</th>
                        <th>Faltas Injustificadas</th>
                    </tr>
                    <xsl:for-each select="//ALUMNO">
                        <xsl:sort select="T_APELLIDO1"/>
                        <xsl:call-template name="lineaAlum">
                            
                            <xsl:with-param name="mediaAlum" select="$media"></xsl:with-param>
                            
                        </xsl:call-template>
                        
                       
                        
                      
                     
                    </xsl:for-each>
                </table>

            </body>
        </html>
    </xsl:template>
    
    <xsl:template name="lineaAlum">
        <xsl:param name="mediaAlum"/>
        <xsl:variable name="nombreCompleto" select="concat(T_APELLIDO1, T_APELLIDO2, ', ', T_NOMBRE_ALU)"/>
        <xsl:variable name="faltasT" select="count(FALTAS_ASISTENCIA/FALTA_ASISTENCIA)"/>                      
        
    <xsl:if test="$faltasT &gt;= $mediaAlum ">
            <tr>
                <td><xsl:value-of select="$nombreCompleto"/></td>
                <td><xsl:value-of select="$faltasT"/></td>
                <td><xsl:value-of select="count(FALTAS_ASISTENCIA/FALTA_ASISTENCIA[C_TIPFAL='I'])"/></td>
            </tr>
    </xsl:if>
        
    </xsl:template>


</xsl:stylesheet>
