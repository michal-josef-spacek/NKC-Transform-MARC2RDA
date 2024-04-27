<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:marc="http://www.loc.gov/MARC21/slim"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:ex="http://fakeIRI.edu/"
    xmlns:rdaw="http://rdaregistry.info/Elements/w/"
    xmlns:rdawd="http://rdaregistry.info/Elements/w/datatype/"
    xmlns:rdawo="http://rdaregistry.info/Elements/w/object/"
    xmlns:rdae="http://rdaregistry.info/Elements/e/"
    xmlns:rdaed="http://rdaregistry.info/Elements/e/datatype/"
    xmlns:rdaeo="http://rdaregistry.info/Elements/e/object/"
    xmlns:rdam="http://rdaregistry.info/Elements/m/"
    xmlns:rdamd="http://rdaregistry.info/Elements/m/datatype/"
    xmlns:rdamo="http://rdaregistry.info/Elements/m/object/"
    xmlns:rdai="http://rdaregistry.info/Elements/i/"
    xmlns:rdaid="http://rdaregistry.info/Elements/i/datatype/"
    xmlns:rdaio="http://rdaregistry.info/Elements/i/object/"
    xmlns:rdaa="http://rdaregistry.info/Elements/a/"
    xmlns:rdaad="http://rdaregistry.info/Elements/a/datatype/"
    xmlns:rdaao="http://rdaregistry.info/Elements/a/object/"
    xmlns:fake="http://fakePropertiesForDemo" exclude-result-prefixes="marc ex" version="3.0">
    <xsl:template name="F526-xx-iabcdz5" expand-text="yes">
        <rdamd:P30137>
            <xsl:text>Reading program: </xsl:text>
            <xsl:if test="marc:subfield[@code = 'i']">
                <xsl:text>.</xsl:text>
            </xsl:if>
            <xsl:for-each
                select="marc:subfield[@code = 'a'] | marc:subfield[@code = 'b'] | marc:subfield[@code = 'c'] | marc:subfield[@code = 'd'] | marc:subfield[@code = 'z']">
                <xsl:if test="@code = 'a'">
                    <xsl:text>Program name: {.}</xsl:text>
                </xsl:if>
                <xsl:if test="@code = 'b'">
                    <xsl:text>Interest level: {.}</xsl:text>
                </xsl:if>
                <xsl:if test="@code = 'c'">
                    <xsl:text>Reading level: {.}</xsl:text>
                </xsl:if>
                <xsl:if test="@code = 'd'">
                    <xsl:text>Title point value: {.}</xsl:text>
                </xsl:if>
                <xsl:if test="@code = 'z'">
                    <xsl:text>Public note: {.}</xsl:text>
                </xsl:if>
                <xsl:if test="position() != last()">
                    <xsl:text>; </xsl:text>
                </xsl:if>
            </xsl:for-each>
            <xsl:if test="marc:subfield[@code = '5']">
                <xsl:text> (At institution: {marc:subfield[@code = '5']})</xsl:text>
            </xsl:if>
        </rdamd:P30137>
    </xsl:template>
    <xsl:template name="F526-xx-x" expand-text="yes">
        <xsl:param name="baseIRI"/>
        <rdf:Description rdf:about="{concat('http://marc2rda.edu/fake/MetaWor/', generate-id())}">
            <!--Does not meet min description of a work; needs to be linked to a metadata exp/man-->
            <rdf:type rdf:resource="http://rdaregistry.info/Elements/c/C10001"/>
            <rdawd:P10002>{concat('MetaWor/', generate-id())}</rdawd:P10002>
            <rdawo:P10617 rdf:resource="{concat($baseIRI,'man')}"/>
            <rdf:type rdf:resource="http://www.w3.org/1999/02/22-rdf-syntax-ns#Statement"/>
            <rdf:subject rdf:resource="{concat($baseIRI,'man')}"/>
            <rdf:predicate rdf:resource="http://rdaregistry.info/Elements/i/datatype/P40026"/>
            <rdf:object>
                <xsl:value-of select="."/>
            </rdf:object>
            <rdawd:P10004>Private</rdawd:P10004>
        </rdf:Description>
    </xsl:template>
    <xsl:template name="F561-xx-au" expand-text="yes">
        <xsl:value-of select="marc:subfield[@code = 'a']"/>
        <xsl:if test="marc:subfield[@code = 'u']">
            <xsl:text> Additional information at: </xsl:text>
            <xsl:for-each select="marc:subfield[@code = 'u']">
                <xsl:value-of select="."/>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each>
        </xsl:if>
        <xsl:if test="marc:subfield[@code = '3']">
            <xsl:text> (Applies to: </xsl:text>
            <xsl:value-of select="marc:subfield[@code = '3']"/>
            <xsl:text>)</xsl:text>
        </xsl:if>
    </xsl:template>
    <xsl:template name="F561-0x" expand-text="yes">
        <xsl:param name="baseIRI"/>
        <xsl:param name="genID"/>
        <rdf:Description rdf:about="{concat('http://marc2rda.edu/fake/MetaWor/', generate-id())}">
            <!--Does not meet min description of a work; needs to be linked to a metadata exp/man-->
            <rdf:type rdf:resource="http://rdaregistry.info/Elements/c/C10001"/>
            <rdawd:P10002>{concat('MetaWor/', generate-id())}</rdawd:P10002>
            <rdawo:P10616 rdf:resource="{concat($baseIRI,'ite',$genID)}"/>
            <rdf:type rdf:resource="http://www.w3.org/1999/02/22-rdf-syntax-ns#Statement"/>
            <rdf:subject rdf:resource="{concat($baseIRI,'ite',$genID)}"/>
            <rdf:predicate rdf:resource="http://rdaregistry.info/Elements/i/datatype/P40026"/>
            <rdf:object>
                <xsl:call-template name="F561-xx-au"/>
            </rdf:object>
            <rdawd:P10004>Private</rdawd:P10004>
        </rdf:Description>
    </xsl:template>
    <!-- 583 - Action Note -->
    <xsl:template name="F583-xx-abcdefhijklnouxz23" expand-text="yes">
        <xsl:for-each select="marc:subfield[not(.[@code = '5']) and not(.[@code = '6'])]">
            <xsl:if test="@code = 'a'">
                <xsl:text>Action: {.}</xsl:text>
            </xsl:if>
            <xsl:if test="@code = 'b'">
                <xsl:text>Action identification: {.}</xsl:text>
            </xsl:if>
            <xsl:if test="@code = 'c'">
                <xsl:text>Time/date of action: {.}</xsl:text>
            </xsl:if>
            <xsl:if test="@code = 'd'">
                <xsl:text>Action interval: {.}</xsl:text>
            </xsl:if>
            <xsl:if test="@code = 'e'">
                <xsl:text>Contingency for action: {.}</xsl:text>
            </xsl:if>
            <xsl:if test="@code = 'f'">
                <xsl:text>Authorization: {.}</xsl:text>
            </xsl:if>
            <xsl:if test="@code = 'h'">
                <xsl:text>Jurisdiction: {.}</xsl:text>
            </xsl:if>
            <xsl:if test="@code = 'i'">
                <xsl:text>Method of action: {.}</xsl:text>
            </xsl:if>
            <xsl:if test="@code = 'j'">
                <xsl:text>Site of action: {.}</xsl:text>
            </xsl:if>
            <xsl:if test="@code = 'k'">
                <xsl:text>Action agent: {.}</xsl:text>
            </xsl:if>
            <xsl:if test="@code = 'l'">
                <xsl:text>Status: {.}</xsl:text>
            </xsl:if>
            <xsl:if test="@code = 'n'">
                <xsl:text>Extent: {.}</xsl:text>
            </xsl:if>
            <xsl:if test="@code = 'o'">
                <xsl:text>Type of unit: {.}</xsl:text>
            </xsl:if>
            <xsl:if test="@code = 'u'">
                <xsl:text>Uniform Resource Identifier: {.}</xsl:text>
            </xsl:if>
            <xsl:if test="@code = 'x' and ../@ind1 = '0'">
                <xsl:text>Private note: {.}</xsl:text>
            </xsl:if>
            <xsl:if test="@code = 'z'">
                <xsl:text>Public note: {.}</xsl:text>
            </xsl:if>
            <xsl:if test="@code = '2'">
                <xsl:text>Source of term: {.}</xsl:text>
            </xsl:if>
            <xsl:if test="@code = '3'">
                <xsl:text>(Applies to: {.})</xsl:text>
            </xsl:if>
            <xsl:if test="position() != last()">
                <xsl:text>; </xsl:text>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="F583-1x-x" expand-text="yes">
        <xsl:param name="baseIRI"/>
        <xsl:param name="genID"/>
        <rdf:Description rdf:about="{concat('http://marc2rda.edu/fake/MetaWor/', generate-id())}">
            <!--Does not meet min description of a work; needs to be linked to a metadata exp/man-->
            <rdf:type rdf:resource="http://rdaregistry.info/Elements/c/C10001"/>
            <rdawd:P10002>{concat('MetaWor/', generate-id())}</rdawd:P10002>
            <rdawo:P10616 rdf:resource="{concat($baseIRI,'ite',$genID)}"/>
            <rdf:type rdf:resource="http://www.w3.org/1999/02/22-rdf-syntax-ns#Statement"/>
            <rdf:subject rdf:resource="{concat($baseIRI,'ite',$genID)}"/>
            <rdf:predicate rdf:resource="http://rdaregistry.info/Elements/i/datatype/P40026"/>
            <rdf:object>
                <xsl:value-of select="."/>
            </rdf:object>
            <rdawd:P10004>Private</rdawd:P10004>
        </rdf:Description>
    </xsl:template>
    <xsl:template name="F583-0x" expand-text="yes">
        <xsl:param name="baseIRI"/>
        <xsl:param name="genID"/>
        <rdf:Description rdf:about="{concat('http://marc2rda.edu/fake/MetaWor/', generate-id())}">
            <!--Does not meet min description of a work; needs to be linked to a metadata exp/man-->
            <rdf:type rdf:resource="http://rdaregistry.info/Elements/c/C10001"/>
            <rdawd:P10002>{concat('MetaWor/', generate-id())}</rdawd:P10002>
            <rdawo:P10616 rdf:resource="{concat($baseIRI,'ite',$genID)}"/>
            <rdf:type rdf:resource="http://www.w3.org/1999/02/22-rdf-syntax-ns#Statement"/>
            <rdf:subject rdf:resource="{concat($baseIRI,'ite',$genID)}"/>
            <rdf:predicate rdf:resource="http://rdaregistry.info/Elements/i/datatype/P40026"/>
            <rdf:object>
                <xsl:call-template name="F583-xx-abcdefhijklnouxz23"/>
            </rdf:object>
            <rdawd:P10004>Private</rdawd:P10004>
        </rdf:Description>
    </xsl:template>
</xsl:stylesheet>
