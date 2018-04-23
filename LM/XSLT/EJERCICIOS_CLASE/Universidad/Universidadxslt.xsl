<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0">
    <xsl:template match="/">
        <table border="1" width="400">
            <tr><td width="155">Alumno:</td><td>Rivas Santos Victor Manuel</td></tr>
            <tr><td width="155">Carrera</td><td>I.T. INFORMATICA</td></tr>
            <tr><td colspan="2"  align="center">ASIGNATURAS</td></tr>
            <xsl:value-of select="asignaturas/asignatura/nombre"/>
        </table>
    </xsl:template>
    
    <xsl:template match="nombre">
        <tr><td colspan="2"><xsl:value-of select="attribute::text()"/></td></tr>
    </xsl:template>
    
</xsl:stylesheet>