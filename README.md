# bird_classification_from_bones_in_R
There are many kinds of birds: pigeons, ducks, ostriches, penguins… Some are good at flying, others can't fly but run fast. Some swim under water, others wading in shallow pool.

According to their living environments and living habits, birds are classified into different ecological groups. There are 8 ecological groups of birds:

Swimming Birds

Wading Birds

Terrestrial Birds

Raptors

Scansorial Birds

Singing Birds

Cursorial Birds (not included in dataset)

Marine Birds (not included in dataset)

First 6 groups are main and are covered by this dataset.

Apparently, birds belong to different ecological groups have different appearances: flying birds have strong wings and wading birds have long legs. Their living habits are somewhat reflected in their bones' shapes. As data scientists we may think of examining the underlying relationship between sizes of bones and ecological groups , and recognising birds' ecological groups by their bones' shapes.

# Content
There are 420 birds contained in this dataset. Each bird is represented by 10 measurements (features):

Length and Diameter of Humerus

Length and Diameter of Ulna

Length and Diameter of Femur

Length and Diameter of Tibiotarsus

Length and Diameter of Tarsometatarsus

Pigeon skeleton

![image](https://user-images.githubusercontent.com/47672757/118973446-4ee4a000-b98f-11eb-980d-e20071c3721c.png)

All measurements are continuous float numbers (mm) with missing values represented by empty strings. The skeletons of this dataset are collections of Natural History Museum of Los Angeles County. They belong to 21 orders, 153 genera, 245 species.

Each bird has a label for its ecological group:

SW: Swimming Birds

W: Wading Birds

T: Terrestrial Birds

R: Raptors

P: Scansorial Birds

SO: Singing Birds


# Methodology
used different algorithms to classify birds
- decision tree
- random forest
- knn
- svm
