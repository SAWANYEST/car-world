# مصادر صور السيارات — عالم السيارات

الصور الفوتوغرافية في بطاقات الموقع من **Wikimedia Commons**. حقوق المصوّرين محفوظة، والترخيص لكل الصور أدناه: [Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)](https://creativecommons.org/licenses/by-sa/4.0/).

تُعرض الصور بحجم مصغّر (حوالي 960 بكسل) وبقصّ بصري لتناسب بطاقات الموقع، دون الادعاء بأنها صور رسمية. أسماء المصورين وروابط المصادر معروضة أسفل كل صورة داخل الموقع.

| السيارة التجريبية | الصورة المعروضة | المصوّر | ملاحظة |
|---|---|---|---|
| تويوتا كامري 2025 | [2025 Toyota Camry LE, front left.jpg](https://commons.wikimedia.org/wiki/File:2025_Toyota_Camry_LE,_front_left.jpg) | MercurySable99؛ اقتصاص: Alex Neman | 2025، فئة LE |
| هيونداي سوناتا 2025 | [2024 Hyundai Sonata (facelift), front.jpg](https://commons.wikimedia.org/wiki/File:2024_Hyundai_Sonata_(facelift),_front.jpg) | Kevauto | صورة للنسخة المحسّنة 2024 من نفس جيل 2025 |
| فورد تورس 2025 | [Ford Taurus 2023 (Front end, GCC Market).jpg](https://commons.wikimedia.org/wiki/File:Ford_Taurus_2023_(Front_end,_GCC_Market).jpg) | Mohammed Hamad | تورس الشرق الأوسط من نفس الجيل (صورة 2023) |
| تويوتا لاندكروزر 2025 | [Toyota LAND CRUISER AX (3BA-VJA300W-GNUAZ) front.jpg](https://commons.wikimedia.org/wiki/File:Toyota_LAND_CRUISER_AX_(3BA-VJA300W-GNUAZ)_front.jpg) | Tokumeigakarinoaoshima | الجيل J300، صورة 2024 |
| كيا سبورتاج 2025 | [2025 Kia Sportage S front only.jpg](https://commons.wikimedia.org/wiki/File:2025_Kia_Sportage_S_front_only.jpg) | LuvsMG481 | طراز 2025، فئة S |
| نيسان ألتيما 2025 | [2024 Nissan Altima SR, front left, 05-05-2025.jpg](https://commons.wikimedia.org/wiki/File:2024_Nissan_Altima_SR,_front_left,_05-05-2025.jpg) | MercurySable99 | سنة 2024 من الجيل نفسه |

## التنفيذ
- المصدر من روابط Wikimedia الثابتة والصور تظهر في البطاقات باستخدام `img` مع `loading="lazy"`.
- بيانات الصور مخزنة في خريطة ثابتة داخل `index.html` بحسب الشركة والطراز؛ **لم يتغير جدول Supabase `cars` أو صلاحيّاته**.
- في حال تعذر تحميل الصورة المصغرة تُجرَّب خدمة Wikimedia `Special:FilePath`؛ إذا فشل الاثنان تظهر رسالة بسيطة بدلاً من صورة مكسورة.
- الصور المعروضة أمثلة فوتوغرافية للطراز أو الجيل المطابق وقد تختلف الفئة أو المواصفات أو السوق؛ بيانات الأسعار والمحركات ما زالت تجريبية.
- التغيير داخل فرع `feat/car-catalog-supabase`؛ **لم يحدث أي نشر Production** أو دمج في `main`.
