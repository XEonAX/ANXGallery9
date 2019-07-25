.class public Lcom/miui/gallery/util/deprecated/Time;
.super Ljava/lang/Object;
.source "Time.java"


# direct methods
.method public static getUpgradeMixedDateTimeSqlString(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, " update  %1$s set %2$s =  coalesce(    strftime(        \'%%s000\',        (            replace(%3$s,\':\',\'-\')||\' \'||            case when substr(%4$s,2,1)=\':\'                then 0|| substr(%4$s,1,1)||\':\'||                    (case when substr(%4$s, 4,1)=\':\'                        then 0|| substr(substr(%4$s,3),1,1) ||\':\'||                            (case when length(substr(%4$s,5))=1                                then 0|| substr(%4$s,5)                                ELSE substr(%4$s,5)                            END)                        ELSE substr(substr(%4$s,3),1,2)||\':\'||                            (case when length(substr(%4$s,6))=1                                then 0|| substr(%4$s,6)                                ELSE substr(%4$s,6)                            END)                        END)                ELSE  substr(%4$s,1,2) ||\':\'||                    (case when substr(%4$s, 5,1)=\':\'                        then 0|| substr(substr(%4$s,4),1,1) ||\':\'||                            (case when length(substr(%4$s,6))=1                                then 0|| substr(%4$s,6)                                ELSE substr(%4$s,6)                            END)                        ELSE substr(substr(%4$s,4),1,2)||\':\'||                            (case when length(substr(%4$s,7))=1                                then 0|| substr(%4$s,7)                                ELSE substr(%4$s,7)                            END)                        END)            END        )    ),    strftime(        \'%%s000\',        (            replace(substr(%5$s,1,10),\':\',\'-\') || \' \' ||substr(%5$s,12,8)        )    )-%7$s,    %6$s  ) "

    const/4 v2, 0x7

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    const-string p0, "mixedDateTime"

    const/4 v3, 0x1

    aput-object p0, v2, v3

    const-string p0, "exifGPSDateStamp"

    const/4 v3, 0x2

    aput-object p0, v2, v3

    const-string p0, "exifGPSTimeStamp"

    const/4 v3, 0x3

    aput-object p0, v2, v3

    const-string p0, "exifDateTime"

    const/4 v3, 0x4

    aput-object p0, v2, v3

    const-string p0, "dateModified"

    const/4 v3, 0x5

    aput-object p0, v2, v3

    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/TimeZone;->getRawOffset()I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    const/4 v3, 0x6

    aput-object p0, v2, v3

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
