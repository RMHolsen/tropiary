#Novels
novel_list = [
    ["Grumpy Old Mercs", "science-fiction", 100000],
    ["I Know What You Did Last Century", "urban-fantasy", 80000],
    ["Sandborn", "fantasy", 75000],
    ["Bloodwives", "historical-fiction", 90000],
]

novel_list.each do |novel|
    n = Novel.new
    n.title = novel[0]
    n.genre = novel[1]
    n.word_count = novel[2]
    n.save
end 

#Characters
char_list = ["Pippa di Rafello",
    "Moriah di Raffello",
    "Sybilla Rochester",
    "Sophie Rochester",
    "Simone Rochester",
    "Dorothy",
    "Timothy Laedecker",
    "Raedwulf",
    "Minna"]

char_list.each do |char|
    c = Character.new
    c.name = char
    c.save
end 

#Tropes
tropes_list = ["There Was Only One Bed",
    "Oh My God They Were Roommates",
    "Walks Calmly Away From The Explosion",
    "Do Androids Dream",
    "Power Trio",
    "Occult Transportation Firm",
    "Post Modern Magik",
    "Doomed Hometown",
    "Cast From Hit Points",
    "Who Wants To Live Forever",
    "Sweet Polly Oliver",
    "You Killed My Father Prepare To Die"
]

tropes_list.each do |trope|
   t = Trope.new
   t.name  = trope
   t.save
end 