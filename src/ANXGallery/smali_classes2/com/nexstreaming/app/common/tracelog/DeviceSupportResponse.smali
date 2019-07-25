.class public Lcom/nexstreaming/app/common/tracelog/DeviceSupportResponse;
.super Ljava/lang/Object;
.source "DeviceSupportResponse.java"

# interfaces
.implements Lcom/nexstreaming/app/common/tracelog/TLP$BaseResponse;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nexstreaming/app/common/tracelog/DeviceSupportResponse$ExportResInfo;,
        Lcom/nexstreaming/app/common/tracelog/DeviceSupportResponse$DeviceInfo;,
        Lcom/nexstreaming/app/common/tracelog/DeviceSupportResponse$MatchInfo;
    }
.end annotation


# instance fields
.field public device_info:Lcom/nexstreaming/app/common/tracelog/DeviceSupportResponse$DeviceInfo;

.field public match_info:Lcom/nexstreaming/app/common/tracelog/DeviceSupportResponse$MatchInfo;

.field public next:I

.field public result:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getResult()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/app/common/tracelog/DeviceSupportResponse;->result:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "DeviceSupportResponse:\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "  result:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/nexstreaming/app/common/tracelog/DeviceSupportResponse;->result:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v2, "  next:"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/nexstreaming/app/common/tracelog/DeviceSupportResponse;->next:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/nexstreaming/app/common/tracelog/DeviceSupportResponse;->match_info:Lcom/nexstreaming/app/common/tracelog/DeviceSupportResponse$MatchInfo;

    if-nez v1, :cond_0

    const-string v1, "  match_info: null\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_0
    const-string v1, "  match_info:\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/nexstreaming/app/common/tracelog/DeviceSupportResponse;->match_info:Lcom/nexstreaming/app/common/tracelog/DeviceSupportResponse$MatchInfo;

    invoke-virtual {v1}, Lcom/nexstreaming/app/common/tracelog/DeviceSupportResponse$MatchInfo;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "(?m)^"

    const-string v3, "    "

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_0
    iget-object v1, p0, Lcom/nexstreaming/app/common/tracelog/DeviceSupportResponse;->device_info:Lcom/nexstreaming/app/common/tracelog/DeviceSupportResponse$DeviceInfo;

    if-nez v1, :cond_1

    const-string v1, "  device_info: null\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    :cond_1
    const-string v1, "  device_info:\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/nexstreaming/app/common/tracelog/DeviceSupportResponse;->device_info:Lcom/nexstreaming/app/common/tracelog/DeviceSupportResponse$DeviceInfo;

    invoke-virtual {v1}, Lcom/nexstreaming/app/common/tracelog/DeviceSupportResponse$DeviceInfo;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "(?m)^"

    const-string v3, "    "

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
