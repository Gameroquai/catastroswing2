<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>Listado universitario</title>
                <meta charset="UTF-8"/>
                <link href="estilo.css" rel="stylesheet" />
            </head>
            <body>
                
                <xsl:apply-templates select="universidad/alumnos/alumno"></xsl:apply-templates>
                
             </body>
        </html>
        
      </xsl:template>
    
    <xsl:template match="alumno">
        <br/>
        <br/>
        <xsl:variable name="cod"  select="estudios/carrera/@codigo"/>
        <table border="1">
            <tr><td>Alumno</td><td><xsl:value-of select="nombre"/></td></tr>
            <tr><td>Carrera</td><td><xsl:value-of select="/universidad/carreras/carrera[@id=$cod]/nombre"/></td></tr>
            <tr><td colspan="2">ADIGNATURAS</td></tr>
            <xsl:for-each select="estudios/asignaturas/asignatura">
                    <xsl:variable name="codAsig" select="@codigo"/>
                       
                   <tr><td colspan="2"><xsl:value-of select="/universidad/asignaturas/asignatura[@id=current()/@codigo]/nombre"/></td></tr>
            </xsl:for-each>
            
            
            
        </table>
        
        
    </xsl:template>
    
    
</xsl:stylesheet>