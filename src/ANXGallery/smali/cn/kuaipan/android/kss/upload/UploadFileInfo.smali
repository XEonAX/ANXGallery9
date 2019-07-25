.class public Lcn/kuaipan/android/kss/upload/UploadFileInfo;
.super Ljava/lang/Object;
.source "UploadFileInfo.java"

# interfaces
.implements Lcn/kuaipan/android/kss/KssDef;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcn/kuaipan/android/kss/upload/UploadFileInfo$BlockInfo;
    }
.end annotation


# instance fields
.field private final mBlockInfos:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcn/kuaipan/android/kss/upload/UploadFileInfo$BlockInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mSha1:Ljava/lang/String;


# direct methods
.method private constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcn/kuaipan/android/kss/upload/UploadFileInfo;->mBlockInfos:Ljava/util/ArrayList;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcn/kuaipan/android/kss/upload/UploadFileInfo;->mBlockInfos:Ljava/util/ArrayList;

    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v1, "sha1"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcn/kuaipan/android/kss/upload/UploadFileInfo;->mSha1:Ljava/lang/String;

    const-string v1, "block_infos"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_5

    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    const/4 v4, 0x0

    if-nez v3, :cond_1

    move-object v5, v4

    goto :goto_1

    :cond_1
    const-string v5, "sha1"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    :goto_1
    if-nez v3, :cond_2

    goto :goto_2

    :cond_2
    const-string v4, "md5"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    :goto_2
    const/4 v6, -0x1

    if-nez v3, :cond_3

    goto :goto_3

    :cond_3
    const-string v7, "size"

    invoke-virtual {v3, v7, v6}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v6

    :goto_3
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_4

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_4

    if-ltz v6, :cond_4

    int-to-long v6, v6

    invoke-virtual {p0, v5, v4, v6, v7}, Lcn/kuaipan/android/kss/upload/UploadFileInfo;->appendBlock(Ljava/lang/String;Ljava/lang/String;J)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "UploadFileInfo"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed parser UploadFileInfo from a String. The String:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_5
    return-void
.end method

.method private getBlockInfos()Lorg/json/JSONArray;
    .locals 6

    :try_start_0
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    iget-object v1, p0, Lcn/kuaipan/android/kss/upload/UploadFileInfo;->mBlockInfos:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcn/kuaipan/android/kss/upload/UploadFileInfo$BlockInfo;

    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    const-string v4, "sha1"

    iget-object v5, v2, Lcn/kuaipan/android/kss/upload/UploadFileInfo$BlockInfo;->sha1:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v4, "md5"

    iget-object v5, v2, Lcn/kuaipan/android/kss/upload/UploadFileInfo$BlockInfo;->md5:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v4, "size"

    iget v2, v2, Lcn/kuaipan/android/kss/upload/UploadFileInfo$BlockInfo;->size:I

    invoke-virtual {v3, v4, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :cond_0
    return-object v0

    :catch_0
    const-string v0, "UploadFileInfo"

    const-string v1, "Failed generate Json String for UploadRequestInfo"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    return-object v0
.end method

.method public static getFileInfo(Ljava/io/File;)Lcn/kuaipan/android/kss/upload/UploadFileInfo;
    .locals 20
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcn/kuaipan/android/exception/KscException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    move-object/from16 v0, p0

    :try_start_0
    new-instance v2, Ljava/io/FileInputStream;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_7
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_6
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    :try_start_1
    invoke-direct {v2, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_1 .. :try_end_1} :catch_5
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_6
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    :try_start_2
    new-instance v3, Lcn/kuaipan/android/kss/upload/UploadFileInfo;

    invoke-direct {v3}, Lcn/kuaipan/android/kss/upload/UploadFileInfo;-><init>()V

    const-string v4, "SHA1"

    invoke-static {v4}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v4

    const-string v5, "SHA1"

    invoke-static {v5}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v5

    const-string v6, "MD5"

    invoke-static {v6}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v6

    const/16 v7, 0x2000

    new-array v7, v7, [B

    const-wide/16 v11, 0x0

    const/4 v13, 0x1

    :goto_0
    invoke-virtual {v2, v7}, Ljava/io/InputStream;->read([B)I

    move-result v14
    :try_end_2
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_2 .. :try_end_2} :catch_4
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    move-object/from16 v16, v2

    const-wide/32 v1, 0x400000

    if-ltz v14, :cond_3

    int-to-long v8, v14

    add-long/2addr v11, v8

    const/4 v8, 0x0

    :try_start_3
    invoke-virtual {v4, v7, v8, v14}, Ljava/security/MessageDigest;->update([BII)V

    int-to-long v8, v13

    mul-long v8, v8, v1

    cmp-long v17, v11, v8

    if-gez v17, :cond_0

    const/4 v15, 0x0

    invoke-virtual {v5, v7, v15, v14}, Ljava/security/MessageDigest;->update([BII)V

    invoke-virtual {v6, v7, v15, v14}, Ljava/security/MessageDigest;->update([BII)V

    move-object/from16 v2, v16

    goto :goto_0

    :cond_0
    const/4 v15, 0x0

    sub-long v8, v11, v8

    long-to-int v8, v8

    sub-int v8, v14, v8

    add-int/lit8 v13, v13, 0x1

    const-string v9, "UploadFileInfo"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "blockoffset: "

    invoke-virtual {v15, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v10, " len: "

    invoke-virtual {v15, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v10, " pos: "

    invoke-virtual {v15, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v10, " blockIndex"

    invoke-virtual {v15, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v10, " blockOffset > input.length: "

    invoke-virtual {v15, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    int-to-long v1, v8

    array-length v10, v7

    move-wide/from16 v18, v11

    int-to-long v10, v10

    cmp-long v12, v1, v10

    if-lez v12, :cond_1

    const/4 v1, 0x1

    goto :goto_1

    :cond_1
    const/4 v1, 0x0

    :goto_1
    invoke-virtual {v15, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v9, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v1, 0x0

    invoke-virtual {v5, v7, v1, v8}, Ljava/security/MessageDigest;->update([BII)V

    invoke-virtual {v6, v7, v1, v8}, Ljava/security/MessageDigest;->update([BII)V

    invoke-virtual {v5}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v1

    invoke-static {v1}, Lcn/kuaipan/android/utils/Encode;->byteArrayToHexString([B)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v6}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v2

    invoke-static {v2}, Lcn/kuaipan/android/utils/Encode;->byteArrayToHexString([B)Ljava/lang/String;

    move-result-object v2

    const-wide/32 v9, 0x400000

    invoke-virtual {v3, v1, v2, v9, v10}, Lcn/kuaipan/android/kss/upload/UploadFileInfo;->appendBlock(Ljava/lang/String;Ljava/lang/String;J)V

    if-le v14, v8, :cond_2

    sub-int/2addr v14, v8

    invoke-virtual {v5, v7, v8, v14}, Ljava/security/MessageDigest;->update([BII)V

    invoke-virtual {v6, v7, v8, v14}, Ljava/security/MessageDigest;->update([BII)V

    :cond_2
    move-object/from16 v2, v16

    move-wide/from16 v11, v18

    goto/16 :goto_0

    :catchall_0
    move-exception v0

    goto/16 :goto_7

    :catch_0
    move-exception v0

    goto :goto_3

    :catch_1
    move-exception v0

    goto :goto_4

    :cond_3
    int-to-long v1, v13

    const-wide/32 v7, 0x400000

    mul-long v1, v1, v7

    cmp-long v9, v1, v11

    if-lez v9, :cond_4

    add-long v9, v11, v7

    cmp-long v7, v1, v9

    if-gez v7, :cond_4

    invoke-virtual {v5}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v0

    invoke-static {v0}, Lcn/kuaipan/android/utils/Encode;->byteArrayToHexString([B)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v1

    invoke-static {v1}, Lcn/kuaipan/android/utils/Encode;->byteArrayToHexString([B)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    sub-int/2addr v13, v2

    int-to-long v5, v13

    const-wide/32 v7, 0x400000

    mul-long v5, v5, v7

    sub-long/2addr v11, v5

    invoke-virtual {v3, v0, v1, v11, v12}, Lcn/kuaipan/android/kss/upload/UploadFileInfo;->appendBlock(Ljava/lang/String;Ljava/lang/String;J)V

    goto :goto_2

    :cond_4
    const-wide/16 v1, 0x0

    cmp-long v5, v11, v1

    if-eqz v5, :cond_5

    :goto_2
    invoke-virtual {v4}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v0

    invoke-static {v0}, Lcn/kuaipan/android/utils/Encode;->byteArrayToHexString([B)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Lcn/kuaipan/android/kss/upload/UploadFileInfo;->setSha1(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    invoke-virtual/range {v16 .. v16}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_2

    :catch_2
    return-object v3

    :cond_5
    :try_start_5
    new-instance v1, Lcn/kuaipan/android/exception/KscRuntimeException;

    const v2, 0x7a123

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, " read error."

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v2, v0}, Lcn/kuaipan/android/exception/KscRuntimeException;-><init>(ILjava/lang/String;)V

    throw v1
    :try_end_5
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_5 .. :try_end_5} :catch_1
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :catchall_1
    move-exception v0

    move-object/from16 v16, v2

    goto :goto_7

    :catch_3
    move-exception v0

    move-object/from16 v16, v2

    :goto_3
    move-object/from16 v1, v16

    goto :goto_5

    :catch_4
    move-exception v0

    move-object/from16 v16, v2

    :goto_4
    move-object/from16 v1, v16

    goto :goto_6

    :catch_5
    move-exception v0

    const/4 v1, 0x0

    goto :goto_6

    :catchall_2
    move-exception v0

    const/16 v16, 0x0

    goto :goto_7

    :catch_6
    move-exception v0

    const/4 v1, 0x0

    :goto_5
    const/4 v2, 0x0

    :try_start_6
    invoke-static {v0, v2}, Lcn/kuaipan/android/exception/KscException;->newException(Ljava/lang/Throwable;Ljava/lang/String;)Lcn/kuaipan/android/exception/KscException;

    move-result-object v0

    throw v0

    :catch_7
    move-exception v0

    const/4 v2, 0x0

    move-object v1, v2

    :goto_6
    new-instance v2, Lcn/kuaipan/android/exception/KscRuntimeException;

    const v3, 0x7a125

    invoke-direct {v2, v3, v0}, Lcn/kuaipan/android/exception/KscRuntimeException;-><init>(ILjava/lang/Throwable;)V

    throw v2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    :catchall_3
    move-exception v0

    move-object/from16 v16, v1

    :goto_7
    :try_start_7
    invoke-virtual/range {v16 .. v16}, Ljava/io/InputStream;->close()V
    :try_end_7
    .catch Ljava/lang/Throwable; {:try_start_7 .. :try_end_7} :catch_8

    :catch_8
    throw v0
.end method


# virtual methods
.method appendBlock(Ljava/lang/String;Ljava/lang/String;J)V
    .locals 2

    iget-object v0, p0, Lcn/kuaipan/android/kss/upload/UploadFileInfo;->mBlockInfos:Ljava/util/ArrayList;

    new-instance v1, Lcn/kuaipan/android/kss/upload/UploadFileInfo$BlockInfo;

    long-to-int p3, p3

    const/4 p4, 0x0

    invoke-direct {v1, p1, p2, p3, p4}, Lcn/kuaipan/android/kss/upload/UploadFileInfo$BlockInfo;-><init>(Ljava/lang/String;Ljava/lang/String;ILcn/kuaipan/android/kss/upload/UploadFileInfo$1;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public getBlockInfo(I)Lcn/kuaipan/android/kss/upload/UploadFileInfo$BlockInfo;
    .locals 1

    iget-object v0, p0, Lcn/kuaipan/android/kss/upload/UploadFileInfo;->mBlockInfos:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt p1, v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    iget-object v0, p0, Lcn/kuaipan/android/kss/upload/UploadFileInfo;->mBlockInfos:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcn/kuaipan/android/kss/upload/UploadFileInfo$BlockInfo;

    return-object p1
.end method

.method public getKssString()Ljava/lang/String;
    .locals 3

    invoke-direct {p0}, Lcn/kuaipan/android/kss/upload/UploadFileInfo;->getBlockInfos()Lorg/json/JSONArray;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    :try_start_0
    const-string v2, "block_infos"

    invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSha1()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcn/kuaipan/android/kss/upload/UploadFileInfo;->mSha1:Ljava/lang/String;

    return-object v0
.end method

.method setSha1(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcn/kuaipan/android/kss/upload/UploadFileInfo;->mSha1:Ljava/lang/String;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    :try_start_0
    const-string v1, "block_infos"

    invoke-direct {p0}, Lcn/kuaipan/android/kss/upload/UploadFileInfo;->getBlockInfos()Lorg/json/JSONArray;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "sha1"

    iget-object v2, p0, Lcn/kuaipan/android/kss/upload/UploadFileInfo;->mSha1:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
