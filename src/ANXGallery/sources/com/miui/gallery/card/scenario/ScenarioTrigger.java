package com.miui.gallery.card.scenario;

import com.miui.gallery.card.Card;
import com.miui.gallery.card.preprocess.ScenarioAlbumTask;
import com.miui.gallery.card.preprocess.ScenarioAlbumTask.CardResult;
import com.miui.gallery.card.preprocess.ScenarioTask;
import com.miui.gallery.cloudcontrol.CloudControlStrategyHelper;
import com.miui.gallery.cloudcontrol.strategies.AssistantScenarioStrategy;
import com.miui.gallery.cloudcontrol.strategies.AssistantScenarioStrategy.CloudTimeScenarioRule;
import com.miui.gallery.cloudcontrol.strategies.AssistantScenarioStrategy.ScenarioRule;
import com.miui.gallery.dao.GalleryEntityManager;
import com.miui.gallery.dao.base.Entity;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.assistant.FlagUtil;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.ListIterator;
import java.util.Locale;
import java.util.Random;
import java.util.TreeSet;

public class ScenarioTrigger {
    private int mFreeScenarioTriggerInterval = 6;
    private final List<Scenario> mFreeScenarios = new LinkedList();
    private final List<Scenario> mGuaranteeScenarios = new LinkedList();
    private final TreeSet<Scenario> mNormalScenarios = new TreeSet<>();

    public ScenarioTrigger() {
        AssistantScenarioStrategy assistantScenarioStrategy = CloudControlStrategyHelper.getAssistantScenarioStrategy();
        if (assistantScenarioStrategy != null) {
            Scenario.setDuplicateRemovalInterval(assistantScenarioStrategy.getDuplicateRemovalInterval());
            Scenario.setDefaultMinImageCount(assistantScenarioStrategy.getDefaultMinImageCount());
            Scenario.setDefaultMaxImageCount(assistantScenarioStrategy.getDefaultMaxImageCount());
            Scenario.setDefaultSelectedMinImageCount(assistantScenarioStrategy.getDefaultMinSelectedImageCount());
            Scenario.setDefaultSelectedMaxImageCount(assistantScenarioStrategy.getDefaultMaxSelectedImageCount());
            this.mFreeScenarioTriggerInterval = assistantScenarioStrategy.getFreeScenarioTriggerInterval();
            List<ScenarioRule> localScenarioRules = assistantScenarioStrategy.getLocalScenarioRules();
            if (MiscUtil.isValid(localScenarioRules)) {
                for (ScenarioRule createLocalScenario : localScenarioRules) {
                    Scenario createLocalScenario2 = ScenarioFactory.createLocalScenario(createLocalScenario);
                    if (createLocalScenario2 != null) {
                        if (createLocalScenario2.getFlag() == 4) {
                            this.mFreeScenarios.add(createLocalScenario2);
                        } else if (createLocalScenario2.getFlag() == 16) {
                            this.mGuaranteeScenarios.add(createLocalScenario2);
                        } else {
                            this.mNormalScenarios.add(createLocalScenario2);
                        }
                    }
                }
            }
            List<CloudTimeScenarioRule> cloudTimeScenarioRules = assistantScenarioStrategy.getCloudTimeScenarioRules();
            if (MiscUtil.isValid(cloudTimeScenarioRules)) {
                for (CloudTimeScenarioRule createCloudTimeScenario : cloudTimeScenarioRules) {
                    Scenario createCloudTimeScenario2 = ScenarioFactory.createCloudTimeScenario(createCloudTimeScenario);
                    if (createCloudTimeScenario2 != null) {
                        this.mNormalScenarios.add(createCloudTimeScenario2);
                    }
                }
            }
        }
    }

    private static boolean addFailedRecord(Record record, Scenario scenario) {
        record.setState(0);
        return addRecord(record);
    }

    private static boolean addRecord(Record record) {
        return GalleryEntityManager.getInstance().insert((Entity) record);
    }

    private boolean isCardGeneratedRecently(long j) {
        boolean z = false;
        List query = GalleryEntityManager.getInstance().query(Card.class, "ignored = 0", null, "createTime desc", String.format(Locale.US, "%s,%s", new Object[]{Integer.valueOf(0), Integer.valueOf(1)}));
        if (!MiscUtil.isValid(query)) {
            return false;
        }
        if (DateUtils.getCurrentTimeMillis() - j < ((Card) query.get(0)).getCreateTime()) {
            z = true;
        }
        return z;
    }

    private void randomSort(List<Scenario> list) {
        if (MiscUtil.isValid(list)) {
            Scenario[] scenarioArr = (Scenario[]) list.toArray(new Scenario[list.size()]);
            int length = scenarioArr.length;
            Random random = new Random();
            while (length > 0) {
                int i = length - 1;
                int nextInt = random.nextInt(length);
                Scenario scenario = scenarioArr[nextInt];
                scenarioArr[nextInt] = scenarioArr[i];
                scenarioArr[i] = scenario;
                length = i;
            }
            ListIterator listIterator = list.listIterator();
            for (Scenario scenario2 : scenarioArr) {
                listIterator.next();
                listIterator.set(scenario2);
            }
        }
    }

    private void statScenarioTriggerFailed() {
        Log.d("ScenarioTrigger", "Scenario Trigger Failed.");
        HashMap hashMap = new HashMap();
        hashMap.put("reason", "No triggered scenario");
        GallerySamplingStatHelper.recordCountEvent("assistant", "assistant_card_create_failed", hashMap);
    }

    /* JADX WARNING: type inference failed for: r3v2 */
    /* JADX WARNING: type inference failed for: r3v3, types: [int] */
    /* JADX WARNING: type inference failed for: r3v4, types: [int] */
    /* JADX WARNING: type inference failed for: r3v5, types: [boolean] */
    /* JADX WARNING: type inference failed for: r3v6 */
    /* JADX WARNING: type inference failed for: r3v7 */
    /* JADX WARNING: type inference failed for: r3v8 */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r3v2
  assigns: [?[int, float, boolean, short, byte, char, OBJECT, ARRAY], ?[boolean, int, float, short, byte, char], int]
  uses: [int, boolean]
  mth insns count: 63
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
    	at jadx.core.ProcessClass.process(ProcessClass.java:35)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 3 */
    private int triggerInternal(Collection<Scenario> collection, int i) {
        for (Scenario scenario : collection) {
            Log.d("ScenarioTrigger", "%s,scenario: %s %s start...", DateUtils.getDateFormat(DateUtils.getCurrentTimeMillis()), scenario.getName(), Integer.valueOf(scenario.getScenarioId()));
            if (FlagUtil.hasFlag(i, scenario.getFlag()) || !scenario.prepare(scenario.findRecords(), scenario.findCards())) {
                Log.d("ScenarioTrigger", "prepare failed");
            } else {
                List loadMediaItem = scenario.loadMediaItem();
                Record record = new Record(scenario, loadMediaItem);
                ? r3 = 0;
                if (loadMediaItem == null || loadMediaItem.size() < scenario.getMinImageCount()) {
                    String str = "ScenarioTrigger";
                    String str2 = "media items is too few %s";
                    if (loadMediaItem != null) {
                        r3 = loadMediaItem.size();
                    }
                    Log.d(str, str2, (Object) Integer.valueOf(r3));
                    addFailedRecord(record, scenario);
                } else if (!addRecord(record)) {
                    Log.e("ScenarioTrigger", "add record error");
                } else {
                    i |= scenario.getFlagDisableMask();
                    Log.d("ScenarioTrigger", "Scenario %s trigger successfully. Try generate card!", (Object) scenario.getClass().getSimpleName());
                    ScenarioAlbumTask scenarioAlbumTask = new ScenarioAlbumTask(2);
                    if (scenario.getFlag() == 16) {
                        r3 = 1;
                    }
                    if (scenarioAlbumTask.generateCard(null, record, r3) == CardResult.HAVE_UNPROCESSED_IMAGES) {
                        ScenarioTask.post(2, String.valueOf(record.getId()), record.getId());
                    }
                }
            }
        }
        return i;
    }

    public Scenario getScenarioById(int i) {
        Iterator it = this.mNormalScenarios.iterator();
        while (it.hasNext()) {
            Scenario scenario = (Scenario) it.next();
            if (scenario.getScenarioId() == i) {
                return scenario;
            }
        }
        for (Scenario scenario2 : this.mFreeScenarios) {
            if (scenario2.getScenarioId() == i) {
                return scenario2;
            }
        }
        for (Scenario scenario3 : this.mGuaranteeScenarios) {
            if (scenario3.getScenarioId() == i) {
                return scenario3;
            }
        }
        return null;
    }

    public synchronized void trigger() {
        int triggerInternal = triggerInternal(this.mNormalScenarios, 0);
        if (triggerInternal == 0 && MiscUtil.isValid(this.mFreeScenarios) && !isCardGeneratedRecently(((long) this.mFreeScenarioTriggerInterval) * 86400000)) {
            ArrayList arrayList = new ArrayList(this.mFreeScenarios);
            randomSort(arrayList);
            triggerInternal = triggerInternal(arrayList, triggerInternal);
        }
        if (triggerInternal == 0) {
            statScenarioTriggerFailed();
        }
    }

    public void triggerGuaranteeScenario() {
        Log.d("ScenarioTrigger", "Trigger guarantee scenarios");
        triggerInternal(this.mGuaranteeScenarios, 0);
    }
}
