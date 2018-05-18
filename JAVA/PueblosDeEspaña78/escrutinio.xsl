<?xml version="1.0"?>
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
<xsl:param name="pueblo"/>		
<xsl:template match="/">
	
<html>
<head>
<link rel="stylesheet" href="muni.css"/>
</head>
<body>
<!--div class="cuerpo"-->
<h2>Resultados por Municipios</h2>
<xsl:for-each select="municipales/escrutinio_sitio[nombre_sitio=$pueblo]">
	<pre>
	<table border ="1">
	<tr class="cabecera" align="center">
	<th colspan="2">RESUMEN DEL ESCRUTINIO DE <xsl:value-of select="nombre_sitio"/></th>
	</tr>
	<tr align="right"><td>      ESCRUTADO:</td><td colspan="2"><xsl:value-of select="concat(porciento_escrutado,' %')"/></td></tr>
	<tr align="right"><td>  CONCEJALES TOTALES:</td><td colspan="2">   <xsl:value-of select="num_a_elegir"/></td></tr> 
	<tr align="right"><td>VOTOS CONTABILIZADOS:</td><td><xsl:value-of select="votos/contabilizados/cantidad"/></td>
									  <td><xsl:value-of select="concat(votos/contabilizados/porcentaje,'%')"/></td></tr>     
	
	</table>
	</pre>
	
	<!--VOTOS PR PARTIDO......-->
	<table border ="1">
	<tr class="cabecera" align="center">
	VOTOS POR PARTIDOS EN <xsl:value-of select="nombre_sitio"/>
	<th>PARTIDO</th><th>CONCEJALES</th><th>VOTOS</th><th> % </th>
	</tr>
	<xsl:for-each select="resultados/partido">
	<tr align="right">
		<td align="left"> <xsl:value-of select="nombre"/></td>
		<td align="right"> <xsl:value-of select="electos"/></td> 
		<td align="left"> <xsl:value-of select="votos_numero"/></td> 
		<td align="left"> <xsl:value-of select="concat(votos_porciento,' %')"/></td> 
	</tr>     
	</xsl:for-each>
	</table>
	
	
</xsl:for-each>
</body>
</html>

</xsl:template>
</xsl:stylesheet>
