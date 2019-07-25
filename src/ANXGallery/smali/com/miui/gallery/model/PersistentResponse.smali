.class public Lcom/miui/gallery/model/PersistentResponse;
.super Lcom/miui/gallery/dao/base/Entity;
.source "PersistentResponse.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/miui/gallery/model/PersistentResponse;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mExpireMillis:J

.field private mLastVisitTime:J

.field private mResponse:Ljava/lang/String;

.field private mUpdateTime:J

.field private mUrl:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/miui/gallery/model/PersistentResponse$1;

    invoke-direct {v0}, Lcom/miui/gallery/model/PersistentResponse$1;-><init>()V

    sput-object v0, Lcom/miui/gallery/model/PersistentResponse;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/dao/base/Entity;-><init>()V

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/dao/base/Entity;-><init>()V

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/model/PersistentResponse;->mUrl:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/model/PersistentResponse;->mResponse:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/model/PersistentResponse;->mUpdateTime:J

    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/model/PersistentResponse;->mLastVisitTime:J

    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/model/PersistentResponse;->mId:J

    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/model/PersistentResponse;->mExpireMillis:J

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;JJJ)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/dao/base/Entity;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/model/PersistentResponse;->mUrl:Ljava/lang/String;

    iput-object p2, p0, Lcom/miui/gallery/model/PersistentResponse;->mResponse:Ljava/lang/String;

    iput-wide p3, p0, Lcom/miui/gallery/model/PersistentResponse;->mUpdateTime:J

    iput-wide p5, p0, Lcom/miui/gallery/model/PersistentResponse;->mLastVisitTime:J

    iput-wide p7, p0, Lcom/miui/gallery/model/PersistentResponse;->mExpireMillis:J

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getExpireMillis()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/model/PersistentResponse;->mExpireMillis:J

    return-wide v0
.end method

.method public getResponse()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/model/PersistentResponse;->mResponse:Ljava/lang/String;

    return-object v0
.end method

.method protected getTableColumns()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/dao/base/TableColumn;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const-string v1, "url"

    const-string v2, "TEXT"

    const/4 v3, 0x1

    invoke-static {v0, v1, v2, v3}, Lcom/miui/gallery/model/PersistentResponse;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Z)V

    const-string v1, "response"

    const-string v2, "TEXT"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/model/PersistentResponse;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "updateTime"

    const-string v2, "INTEGER"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/model/PersistentResponse;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "lastVisitTime"

    const-string v2, "INTEGER"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/model/PersistentResponse;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "expireMillis"

    const-string v2, "INTEGER"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/model/PersistentResponse;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method protected getUniqueConstraints()[Ljava/lang/String;
    .locals 1

    const-string v0, "url"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getUpdateTime()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/model/PersistentResponse;->mUpdateTime:J

    return-wide v0
.end method

.method protected onConvertToContents(Landroid/content/ContentValues;)V
    .locals 3

    const-string v0, "url"

    iget-object v1, p0, Lcom/miui/gallery/model/PersistentResponse;->mUrl:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "response"

    iget-object v1, p0, Lcom/miui/gallery/model/PersistentResponse;->mResponse:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "updateTime"

    iget-wide v1, p0, Lcom/miui/gallery/model/PersistentResponse;->mUpdateTime:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v0, "lastVisitTime"

    iget-wide v1, p0, Lcom/miui/gallery/model/PersistentResponse;->mLastVisitTime:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v0, "expireMillis"

    iget-wide v1, p0, Lcom/miui/gallery/model/PersistentResponse;->mExpireMillis:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    return-void
.end method

.method protected onInitFromCursor(Landroid/database/Cursor;)V
    .locals 2

    const-string v0, "url"

    invoke-static {p1, v0}, Lcom/miui/gallery/model/PersistentResponse;->getString(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/model/PersistentResponse;->mUrl:Ljava/lang/String;

    const-string v0, "response"

    invoke-static {p1, v0}, Lcom/miui/gallery/model/PersistentResponse;->getString(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/model/PersistentResponse;->mResponse:Ljava/lang/String;

    const-string v0, "updateTime"

    invoke-static {p1, v0}, Lcom/miui/gallery/model/PersistentResponse;->getLong(Landroid/database/Cursor;Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/model/PersistentResponse;->mUpdateTime:J

    const-string v0, "lastVisitTime"

    invoke-static {p1, v0}, Lcom/miui/gallery/model/PersistentResponse;->getLong(Landroid/database/Cursor;Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/model/PersistentResponse;->mLastVisitTime:J

    const-string v0, "expireMillis"

    invoke-static {p1, v0}, Lcom/miui/gallery/model/PersistentResponse;->getLong(Landroid/database/Cursor;Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/model/PersistentResponse;->mExpireMillis:J

    return-void
.end method

.method public setLastVisitTime(J)V
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/model/PersistentResponse;->mLastVisitTime:J

    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2

    iget-object p2, p0, Lcom/miui/gallery/model/PersistentResponse;->mUrl:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-object p2, p0, Lcom/miui/gallery/model/PersistentResponse;->mResponse:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-wide v0, p0, Lcom/miui/gallery/model/PersistentResponse;->mUpdateTime:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    iget-wide v0, p0, Lcom/miui/gallery/model/PersistentResponse;->mLastVisitTime:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    iget-wide v0, p0, Lcom/miui/gallery/model/PersistentResponse;->mId:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    iget-wide v0, p0, Lcom/miui/gallery/model/PersistentResponse;->mExpireMillis:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    return-void
.end method
