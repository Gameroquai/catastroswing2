<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="/">
        
        <ul>
            <xsl:apply-templates select="//FALTAS_ASISTENCIA"/>
            
            
        </ul>
        
        
    </xsl:template>
    <xsl:template match="FALTAS_ASISTENCIA">
      <li> <xsl:value-of select="FALTA_ASISTENCIA/../../T_NOMBRE_ALU"/> </li>
        
    </xsl:template>
    
    
    
</xsl:stylesheet>