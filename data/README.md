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

