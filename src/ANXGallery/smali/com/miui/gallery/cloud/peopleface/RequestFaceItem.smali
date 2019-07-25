.class public Lcom/miui/gallery/cloud/peopleface/RequestFaceItem;
.super Lcom/miui/gallery/cloud/RequestItemBase;
.source "RequestFaceItem.java"


# instance fields
.field public face:Lcom/miui/gallery/cloud/peopleface/PeopleFace;


# direct methods
.method public constructor <init>(ILcom/miui/gallery/cloud/peopleface/PeopleFace;)V
    .locals 2

    const-wide/16 v0, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/miui/gallery/cloud/RequestItemBase;-><init>(IJ)V

    iput-object p2, p0, Lcom/miui/gallery/cloud/peopleface/RequestFaceItem;->face:Lcom/miui/gallery/cloud/peopleface/PeopleFace;

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/peopleface/RequestFaceItem;->init()V

    return-void
.end method


# virtual methods
.method public getItems()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/cloud/RequestItemBase;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method

.method public getRequestLimitAGroup()I
    .locals 1

    const/16 v0, 0x32

    return v0
.end method

.method public isInSameAlbum(Lcom/miui/gallery/cloud/RequestItemBase;)Z
    .locals 2

    check-cast p1, Lcom/miui/gallery/cloud/peopleface/RequestFaceItem;

    iget-object v0, p1, Lcom/miui/gallery/cloud/peopleface/RequestFaceItem;->face:Lcom/miui/gallery/cloud/peopleface/PeopleFace;

    iget v0, v0, Lcom/miui/gallery/cloud/peopleface/PeopleFace;->localFlag:I

    iget-object v1, p0, Lcom/miui/gallery/cloud/peopleface/RequestFaceItem;->face:Lcom/miui/gallery/cloud/peopleface/PeopleFace;

    iget v1, v1, Lcom/miui/gallery/cloud/peopleface/PeopleFace;->localFlag:I

    if-ne v0, v1, :cond_1

    iget-object v0, p1, Lcom/miui/gallery/cloud/peopleface/RequestFaceItem;->face:Lcom/miui/gallery/cloud/peopleface/PeopleFace;

    iget v0, v0, Lcom/miui/gallery/cloud/peopleface/PeopleFace;->localFlag:I

    const/4 v1, 0x5

    if-ne v0, v1, :cond_0

    iget-object p1, p1, Lcom/miui/gallery/cloud/peopleface/RequestFaceItem;->face:Lcom/miui/gallery/cloud/peopleface/PeopleFace;

    iget-object p1, p1, Lcom/miui/gallery/cloud/peopleface/PeopleFace;->localGroupId:Ljava/lang/String;

    iget-object v0, p0, Lcom/miui/gallery/cloud/peopleface/RequestFaceItem;->face:Lcom/miui/gallery/cloud/peopleface/PeopleFace;

    iget-object v0, v0, Lcom/miui/gallery/cloud/peopleface/PeopleFace;->localGroupId:Ljava/lang/String;

    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    return p1

    :cond_0
    iget-object v0, p1, Lcom/miui/gallery/cloud/peopleface/RequestFaceItem;->face:Lcom/miui/gallery/cloud/peopleface/PeopleFace;

    iget v0, v0, Lcom/miui/gallery/cloud/peopleface/PeopleFace;->localFlag:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    iget-object p1, p1, Lcom/miui/gallery/cloud/peopleface/RequestFaceItem;->face:Lcom/miui/gallery/cloud/peopleface/PeopleFace;

    iget-object p1, p1, Lcom/miui/gallery/cloud/peopleface/PeopleFace;->groupId:Ljava/lang/String;

    iget-object v0, p0, Lcom/miui/gallery/cloud/peopleface/RequestFaceItem;->face:Lcom/miui/gallery/cloud/peopleface/PeopleFace;

    iget-object v0, v0, Lcom/miui/gallery/cloud/peopleface/PeopleFace;->groupId:Ljava/lang/String;

    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    return p1

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method public supportMultiRequest()Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/cloud/peopleface/RequestFaceItem;->face:Lcom/miui/gallery/cloud/peopleface/PeopleFace;

    iget v0, v0, Lcom/miui/gallery/cloud/peopleface/PeopleFace;->localFlag:I

    const/4 v1, 0x5

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
