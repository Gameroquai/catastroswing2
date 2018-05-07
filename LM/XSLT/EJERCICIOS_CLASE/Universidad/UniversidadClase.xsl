<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="/">
    <html>
        <head>
            <title>
                <meta charset="UTF-8"></meta>
                <link href="estilo.css" rel="stylesheet"></link>
            </title>
        </head>
        <body>
            <xsl:apply-templates select="universidad/alumnos/alumno"></xsl:apply-templates>
        </body>
    </html>
        
    </xsl:template>
    <xsl:template match="alumno">
        <table border="1" width="400">
            <tr><td width="155">Alumno:</td><td><xsl:value-of select="nombre"/></td></tr>
            <tr><td width="155">Carrera</td><td><xsl:value-of select="estudios/carrera/@codigo"/></td></tr>
            <tr><td colspan="2"  align="center">ASIGNATURAS</td></tr>
            
            <xsl:for-each select="estudios/asignaturas/asignatura">
                <tr><td colspan="2"><xsl:value-of select="/universidad/carreras/carrera[@id='estudios[1]/asignaturas[1]/asignatura[1]/@titulacion']/nombre"/></td></tr>
           </xsl:for-each>
        </table>
    </xsl:template>
</xsl:stylesheet>