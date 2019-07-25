.class public Lcom/nexstreaming/nexeditorsdk/nexEngine$ProfileAndLevel;
.super Ljava/lang/Object;
.source "nexEngine.java"

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nexstreaming/nexeditorsdk/nexEngine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ProfileAndLevel"
.end annotation


# instance fields
.field private level:I

.field private profile:I


# direct methods
.method private constructor <init>(II)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$ProfileAndLevel;->profile:I

    iput p2, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$ProfileAndLevel;->level:I

    return-void
.end method

.method synthetic constructor <init>(IILcom/nexstreaming/nexeditorsdk/nexEngine$1;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/nexstreaming/nexeditorsdk/nexEngine$ProfileAndLevel;-><init>(II)V

    return-void
.end method


# virtual methods
.method protected clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getLevel()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$ProfileAndLevel;->level:I

    return v0
.end method

.method public getProfile()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$ProfileAndLevel;->profile:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ProfileAndLevel{level="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$ProfileAndLevel;->level:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", profile="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$ProfileAndLevel;->profile:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
