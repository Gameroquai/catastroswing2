<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="/">
        
        <ul>
            <xsl:apply-templates select="//ALUMNO"/>
            
            
        </ul>
        
        
    </xsl:template>
    <xsl:template match="ALUMNO">
        <xsl:if test="FALTAS_ASISTENCIA/FALTA_ASISTENCIA">
          <li> <xsl:value-of select="T_NOMBRE_ALU"/> </li>
        </xsl:if>
    </xsl:template>
    
    
    
</xsl:stylesheet>