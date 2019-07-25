.class public Lcom/miui/gallery/model/PeopleContactInfo;
.super Ljava/lang/Object;
.source "PeopleContactInfo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/model/PeopleContactInfo$UserDefineRelation;,
        Lcom/miui/gallery/model/PeopleContactInfo$Relation;
    }
.end annotation


# static fields
.field private static JSON_TAG_PHONE_NUMBER:Ljava/lang/String; = "phoneNumbers"

.field private static JSON_TAG_RELATION:Ljava/lang/String; = "relation"

.field private static JSON_TAG_RELATIONSHIP:Ljava/lang/String; = "relationship"

.field private static JSON_TAG_RELATIONTEXT:Ljava/lang/String; = "relationText"

.field public static sRelationItemsValue:[Ljava/lang/String;


# instance fields
.field public coverPath:Ljava/lang/String;

.field public isRepeatName:Z

.field public localGroupId:Ljava/lang/String;

.field public name:Ljava/lang/String;

.field public phone:Ljava/lang/String;

.field public relationWithMe:Ljava/lang/String;

.field public relationWithMeText:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Lcom/miui/gallery/model/PeopleContactInfo;->initRelationItemsValue()V

    return-void
.end method

.method public static fromJson(Ljava/lang/String;)Lcom/miui/gallery/model/PeopleContactInfo;
    .locals 4

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return-object v1

    :cond_0
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    new-instance p0, Lcom/miui/gallery/model/PeopleContactInfo;

    invoke-direct {p0}, Lcom/miui/gallery/model/PeopleContactInfo;-><init>()V

    sget-object v2, Lcom/miui/gallery/model/PeopleContactInfo;->JSON_TAG_PHONE_NUMBER:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    sget-object v2, Lcom/miui/gallery/model/PeopleContactInfo;->JSON_TAG_PHONE_NUMBER:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    check-cast v2, Ljava/lang/String;

    iput-object v2, p0, Lcom/miui/gallery/model/PeopleContactInfo;->phone:Ljava/lang/String;

    :cond_1
    sget-object v2, Lcom/miui/gallery/model/PeopleContactInfo;->JSON_TAG_RELATIONSHIP:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    sget-object v2, Lcom/miui/gallery/model/PeopleContactInfo;->JSON_TAG_RELATIONSHIP:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    sget-object v3, Lcom/miui/gallery/model/PeopleContactInfo;->JSON_TAG_RELATION:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/miui/gallery/model/PeopleContactInfo;->relationWithMe:Ljava/lang/String;

    iget-object v2, p0, Lcom/miui/gallery/model/PeopleContactInfo;->relationWithMe:Ljava/lang/String;

    invoke-static {v2}, Lcom/miui/gallery/model/PeopleContactInfo;->getRelationType(Ljava/lang/String;)I

    move-result v2

    invoke-static {v2}, Lcom/miui/gallery/model/PeopleContactInfo;->isUserDefineRelation(I)Z

    move-result v2

    if-eqz v2, :cond_2

    sget-object v2, Lcom/miui/gallery/model/PeopleContactInfo;->JSON_TAG_RELATIONSHIP:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    sget-object v2, Lcom/miui/gallery/model/PeopleContactInfo;->JSON_TAG_RELATIONTEXT:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/model/PeopleContactInfo;->relationWithMeText:Ljava/lang/String;

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/model/PeopleContactInfo;->relationWithMe:Ljava/lang/String;

    iput-object v0, p0, Lcom/miui/gallery/model/PeopleContactInfo;->relationWithMeText:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_3
    :goto_0
    return-object p0

    :catch_0
    return-object v1
.end method

.method public static getDefaultNameForMyself(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v0, 0x7f100463

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getRelation(I)Lcom/miui/gallery/model/PeopleContactInfo$Relation;
    .locals 0

    invoke-static {p0}, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->fromRelationType(I)Lcom/miui/gallery/model/PeopleContactInfo$Relation;

    move-result-object p0

    return-object p0
.end method

.method public static getRelationName(Lcom/miui/gallery/model/PeopleContactInfo$Relation;)Ljava/lang/String;
    .locals 3

    invoke-static {}, Lcom/miui/gallery/model/PeopleContactInfo;->initRelationItemsValue()V

    invoke-static {p0}, Lcom/miui/gallery/model/PeopleContactInfo;->getRelationValue(Lcom/miui/gallery/model/PeopleContactInfo$Relation;)Ljava/lang/String;

    move-result-object p0

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f020012

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_1

    sget-object v2, Lcom/miui/gallery/model/PeopleContactInfo;->sRelationItemsValue:[Ljava/lang/String;

    aget-object v2, v2, v1

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    aget-object p0, v0, v1

    return-object p0

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method public static getRelationOrderSql()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "CASE relationType WHEN "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->myself:Lcom/miui/gallery/model/PeopleContactInfo$Relation;

    invoke-virtual {v1}, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->getRelationType()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " THEN 0"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " WHEN "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->child:Lcom/miui/gallery/model/PeopleContactInfo$Relation;

    invoke-virtual {v1}, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->getRelationType()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " THEN 1"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " WHEN "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->family:Lcom/miui/gallery/model/PeopleContactInfo$Relation;

    invoke-virtual {v1}, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->getRelationType()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " THEN 2"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " WHEN "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->collegue:Lcom/miui/gallery/model/PeopleContactInfo$Relation;

    invoke-virtual {v1}, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->getRelationType()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " THEN 3"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " WHEN "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->classmate:Lcom/miui/gallery/model/PeopleContactInfo$Relation;

    invoke-virtual {v1}, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->getRelationType()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " THEN 4"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " WHEN "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->friend:Lcom/miui/gallery/model/PeopleContactInfo$Relation;

    invoke-virtual {v1}, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->getRelationType()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " THEN 5"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " WHEN "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->userDefine:Lcom/miui/gallery/model/PeopleContactInfo$Relation;

    invoke-virtual {v1}, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->getRelationType()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " THEN 6"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " WHEN "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->unknown:Lcom/miui/gallery/model/PeopleContactInfo$Relation;

    invoke-virtual {v1}, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->getRelationType()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " THEN 7"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " ELSE 8 END "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getRelationShow(I)Ljava/lang/String;
    .locals 4

    if-gez p0, :cond_0

    sget-object p0, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->unknown:Lcom/miui/gallery/model/PeopleContactInfo$Relation;

    invoke-virtual {p0}, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->getRelationType()I

    move-result p0

    :cond_0
    invoke-static {p0}, Lcom/miui/gallery/model/PeopleContactInfo;->getRelation(I)Lcom/miui/gallery/model/PeopleContactInfo$Relation;

    move-result-object p0

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f020012

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lcom/miui/gallery/model/PeopleContactInfo;->initRelationItemsValue()V

    const/4 v1, 0x0

    :goto_0
    sget-object v2, Lcom/miui/gallery/model/PeopleContactInfo;->sRelationItemsValue:[Ljava/lang/String;

    array-length v2, v2

    if-ge v1, v2, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->name()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/miui/gallery/model/PeopleContactInfo;->sRelationItemsValue:[Ljava/lang/String;

    aget-object v3, v3, v1

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    aget-object p0, v0, v1

    return-object p0

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    const-string p0, ""

    return-object p0
.end method

.method public static getRelationType(Ljava/lang/String;)I
    .locals 5

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object p0, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->unknown:Lcom/miui/gallery/model/PeopleContactInfo$Relation;

    invoke-virtual {p0}, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->getRelationType()I

    move-result p0

    return p0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->values()[Lcom/miui/gallery/model/PeopleContactInfo$Relation;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_2

    aget-object v3, v0, v2

    invoke-static {p0}, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->valueOf(Ljava/lang/String;)Lcom/miui/gallery/model/PeopleContactInfo$Relation;

    move-result-object v4

    if-ne v3, v4, :cond_1

    invoke-virtual {v3}, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->getRelationType()I

    move-result p0

    return p0

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    sget-object p0, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->unknown:Lcom/miui/gallery/model/PeopleContactInfo$Relation;

    invoke-virtual {p0}, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->getRelationType()I

    move-result p0

    return p0
.end method

.method public static getRelationTypesCount()I
    .locals 1

    invoke-static {}, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->values()[Lcom/miui/gallery/model/PeopleContactInfo$Relation;

    move-result-object v0

    array-length v0, v0

    return v0
.end method

.method public static getRelationValue(Lcom/miui/gallery/model/PeopleContactInfo$Relation;)Ljava/lang/String;
    .locals 6

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/model/PeopleContactInfo;->initRelationItemsValue()V

    sget-object v1, Lcom/miui/gallery/model/PeopleContactInfo;->sRelationItemsValue:[Ljava/lang/String;

    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_2

    aget-object v4, v1, v3

    invoke-static {v4}, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->valueOf(Ljava/lang/String;)Lcom/miui/gallery/model/PeopleContactInfo$Relation;

    move-result-object v5

    if-ne p0, v5, :cond_1

    return-object v4

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    return-object v0
.end method

.method public static getSystemRelationNameItems()Ljava/util/ArrayList;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    invoke-static {}, Lcom/miui/gallery/model/PeopleContactInfo;->initRelationItemsValue()V

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f020012

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->unknown:Lcom/miui/gallery/model/PeopleContactInfo$Relation;

    invoke-virtual {v1}, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    const/4 v3, 0x0

    :goto_0
    array-length v4, v0

    if-ge v3, v4, :cond_1

    sget-object v4, Lcom/miui/gallery/model/PeopleContactInfo;->sRelationItemsValue:[Ljava/lang/String;

    aget-object v4, v4, v3

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    aget-object v4, v0, v3

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    return-object v2
.end method

.method public static getSystemRelationValueItems()Ljava/util/ArrayList;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    invoke-static {}, Lcom/miui/gallery/model/PeopleContactInfo;->initRelationItemsValue()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sget-object v1, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->unknown:Lcom/miui/gallery/model/PeopleContactInfo$Relation;

    invoke-virtual {v1}, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    :goto_0
    sget-object v3, Lcom/miui/gallery/model/PeopleContactInfo;->sRelationItemsValue:[Ljava/lang/String;

    array-length v3, v3

    if-ge v2, v3, :cond_1

    sget-object v3, Lcom/miui/gallery/model/PeopleContactInfo;->sRelationItemsValue:[Ljava/lang/String;

    aget-object v3, v3, v2

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    sget-object v3, Lcom/miui/gallery/model/PeopleContactInfo;->sRelationItemsValue:[Ljava/lang/String;

    aget-object v3, v3, v2

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public static getUserDefineRelation()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->userDefine:Lcom/miui/gallery/model/PeopleContactInfo$Relation;

    invoke-virtual {v0}, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getUserDefineRelationIndex()I
    .locals 1

    sget-object v0, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->userDefine:Lcom/miui/gallery/model/PeopleContactInfo$Relation;

    invoke-virtual {v0}, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->getRelationType()I

    move-result v0

    return v0
.end method

.method public static getUserDefineRelationOrderSql()Ljava/lang/String;
    .locals 1

    const-string v0, "(CASE WHEN relationType = 7 THEN relationText ELSE NULL END) COLLATE LOCALIZED "

    return-object v0
.end method

.method private static initRelationItemsValue()V
    .locals 2

    sget-object v0, Lcom/miui/gallery/model/PeopleContactInfo;->sRelationItemsValue:[Ljava/lang/String;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f020013

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/model/PeopleContactInfo;->sRelationItemsValue:[Ljava/lang/String;

    :cond_0
    return-void
.end method

.method public static isBabyRelation(I)Z
    .locals 1

    sget-object v0, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->child:Lcom/miui/gallery/model/PeopleContactInfo$Relation;

    invoke-virtual {v0}, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->getRelationType()I

    move-result v0

    if-ne p0, v0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static isUnKnownRelation(I)Z
    .locals 1

    sget-object v0, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->unknown:Lcom/miui/gallery/model/PeopleContactInfo$Relation;

    invoke-virtual {v0}, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->getRelationType()I

    move-result v0

    if-ne p0, v0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static isUserDefineRelation(I)Z
    .locals 1

    sget-object v0, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->userDefine:Lcom/miui/gallery/model/PeopleContactInfo$Relation;

    invoke-virtual {v0}, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->getRelationType()I

    move-result v0

    if-ne p0, v0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method


# virtual methods
.method public formatContactJson()Ljava/lang/String;
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/model/PeopleContactInfo;->phone:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/miui/gallery/model/PeopleContactInfo;->relationWithMe:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    if-nez v0, :cond_0

    if-eqz v1, :cond_3

    :cond_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    if-eqz v0, :cond_1

    :try_start_0
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/miui/gallery/model/PeopleContactInfo;->phone:Ljava/lang/String;

    invoke-virtual {v0, v3, v4}, Lorg/json/JSONArray;->put(ILjava/lang/Object;)Lorg/json/JSONArray;

    sget-object v3, Lcom/miui/gallery/model/PeopleContactInfo;->JSON_TAG_PHONE_NUMBER:Ljava/lang/String;

    invoke-virtual {v2, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_1
    if-eqz v1, :cond_2

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    sget-object v1, Lcom/miui/gallery/model/PeopleContactInfo;->JSON_TAG_RELATION:Ljava/lang/String;

    iget-object v3, p0, Lcom/miui/gallery/model/PeopleContactInfo;->relationWithMe:Ljava/lang/String;

    invoke-virtual {v0, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    sget-object v1, Lcom/miui/gallery/model/PeopleContactInfo;->JSON_TAG_RELATIONTEXT:Ljava/lang/String;

    iget-object v3, p0, Lcom/miui/gallery/model/PeopleContactInfo;->relationWithMeText:Ljava/lang/String;

    invoke-virtual {v0, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    sget-object v1, Lcom/miui/gallery/model/PeopleContactInfo;->JSON_TAG_RELATIONSHIP:Ljava/lang/String;

    invoke-virtual {v2, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_2
    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    :cond_3
    const/4 v0, 0x0

    return-object v0
.end method

.method public getRelationType()I
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/model/PeopleContactInfo;->relationWithMe:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->unknown:Lcom/miui/gallery/model/PeopleContactInfo$Relation;

    invoke-virtual {v0}, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->getRelationType()I

    move-result v0

    return v0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->values()[Lcom/miui/gallery/model/PeopleContactInfo$Relation;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_2

    aget-object v3, v0, v2

    iget-object v4, p0, Lcom/miui/gallery/model/PeopleContactInfo;->relationWithMe:Ljava/lang/String;

    invoke-static {v4}, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->valueOf(Ljava/lang/String;)Lcom/miui/gallery/model/PeopleContactInfo$Relation;

    move-result-object v4

    if-ne v3, v4, :cond_1

    invoke-virtual {v3}, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->getRelationType()I

    move-result v0

    return v0

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    sget-object v0, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->unknown:Lcom/miui/gallery/model/PeopleContactInfo$Relation;

    invoke-virtual {v0}, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->getRelationType()I

    move-result v0

    return v0
.end method
