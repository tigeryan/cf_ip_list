<cfcomponent displayname="CF_IP_LIST" output="false" hint="I am the CF_IP_LIST component.">

    <cffunction name="init" access="public" output="false" hint="I initialize the component.">
        <cfreturn this />
    </cffunction>

    <cffunction name="checkIP" access="remote" output="false" returntype="Struct">
        <cfargument name="ip_address" type="string" required="true" hint="must be an IP" />
        <!---
            TO DO
            ------
            - check for IPv4 or IPv6
            - do a lookup on IP address
            - score the returned IP
            - 0 - 10 scoring (0 = safe | 10 = BLOCK, Oh YEAH BLOCK IT)
    
        --->
        <cfscript>
            returnStruct = StructNew();
            StructInsert(returnStruct,"ip_address",arguments.ip_address);
            StructInsert(returnStruct,"ip_score",0);
            StructInsert(returnStruct,"last_report",Now());
            StructInsert(returnStruct,"number_reports",0);
        </cfscript>
        <cfreturn returnStruct />
    </cffunction>
    
    <cffunction name="addIP" access="remote" output="false" returntype="Struct">
        <cfargument name="ip_address" type="String" required="true" />
        <cfargument name="report_type" type="numeric" required="true" hint="1-Probe 2-Hacker 3-SpamBot etc" />
        <cfargument name="details" type="string" required="true" hint="pass along some code to show why this ip is being reported" />
        
        <!---
            TO DO
            -----
            - store in DB
            - add reporter_ip_address (cgi.remote_addr)
            - add reported_datetime
            - only allow one report per x minutes (prevent spamming service)
        --->
        <cfscript>
            returnStruct = StructNew();
            StructInsert(returnStruct,"ip_address",arguments.ip_address);
        </cfscript>
        <cfreturn returnStruct />
    </cffunction>

    <cffunction name="requestRemoval" access="remote" output="false" returnstype="Struct">
        <cfargument name="ip_address" type="String" required="true" />
        <cfargument name="request_email" type="String" required="true" />
        <cfargument name="explanation" type="String" required="true" />
        <!---
            TO DO
            -----
            - store in DB
            - ?send email?
            - only allow one removal request per x minutes (prevent spamming service)
        --->
        <cfscript>
            returnStruct = StructNew();
            StructInsert(returnStruct,"ip_address",arguments.ip_address);
        </cfscript>
        <cfreturn returnStruct />
    </cffunction>
            
</cfcomponent>