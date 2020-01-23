Gpisum_data and Site_data contain all of the necessary data to recreate this paper.

---

## Explanation of gpisum-data.csv columns:

* Depth: the categorical depth (shallow or deep) that the macrophyte was sampled from
* site: one of 5 site main sampling locations.
* sample: 3 macrophyte specimens were ideally for each species, depth, and site, `sample` is an identifier.
* species: the species of macrophyte sampled
* species_code: abbreviation of species
* observer: which of the authors processed the macrophyte sample of that row. Each author processed only 1 of 3 samples per species'*'depth'*'site in order to limit observer bias
* mac_height_cm: height of macrophtye, from base to apical point, measured in cm
* blu_cm: the bottom length unaffected in cm
* tla_cm: the sum of the total length affected by G. pisum on each macrophyte sample. tla_cm can be longer than the height of the macrophyte because tla_cm is a sum of affected length accross all branches of the macrophyte sample
* alu_cm: the sum of apical length unaffected on each macrophyte sample. Is summed across all branches containing an apical length unaffected
* length_sampled: the length of the section of macrophyte sampled for G. pisum
* mac_mass: wetmass in g of the cleaned section of macrophyte sampled for G. pisum
* gpisum_mass: wetmass in g of G. pisum removed from the section of macrophyte sampled
* gpisum_per_gmac: ratio of G. pisum wetmass : macrophyte wetmass
* macrophyte_total_wetmass_g: An estimation calculated for C. demersum and M. spicatum by extrapolating the mass:length ratio of the section of macrophyte sampled for G. pisum across the entire length of macrophytpe (blu_cm + tla_cm + alu_cm). For E. canadensis this measure was directly taken
* gpisum_wetmass_g_per_macrophyte: An estimation calculated for C. demersum and M. spicatum using the mass G. pisum:length macrophyte from the section of macrophyte sampled and extrapolating across the total length affected (tla_cm). For E. canadensis this measure was directly taken
* notes: notes taken during sample processing


## Explanation of all-samples-data.csv

* num_leaves: number of leaves in the sample
* main_stem_length: the length of the sample in cm
* mass: mass of the sample in g
* gpisum_mass: mass in g of Gloeotrichia pisum on the sample


## Explanation of ec-surface-area.csv

* stem_one, stem_two: the width, in cm, of the first and second stem sample, respectively
* Leaf_1, 2, 3, 4, 5: the surface area, in cm^2, of the 5 leaves sampled


## Explanation of ms-surface-area.csv

* main_stem_width_one, two: the width of the two macrophyte stem samples in cm
* leaf: an identifier, which of 5 leaf samples the measures belong to
* leaf_cent_stem_length: the length of each leaf's central stem in cm
* leaf_cent_stem_width: the width of each leaf's central stem in cm, measured in the middle of the leaf's central stem
* num_sideshoots: the number of leaflets on each leaf
* len_shoot1, 2, 3, 4, 5: the length of leaflet 1..5
* wid_shoot1 2, 3, 4, 5: the width of each leaflet, measured in the middle of the leaflet

