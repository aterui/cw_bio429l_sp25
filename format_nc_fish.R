
# setup -------------------------------------------------------------------

pacman::p_load(tidyverse)

# read nc, combine --------------------------------------------------------

df_nc_fish0 <- list.files("data_raw/nc_fish",
           full.names = TRUE) %>% 
  lapply(read_csv) %>% 
  bind_rows()

df_nc_fish <- df_nc_fish0 %>% 
  rename_with(.fn = function(x) {
    str_to_lower(x) %>% 
      str_replace_all("\\s", "_")
  }) %>% 
  filter(no_coll > 0) %>% 
  mutate(across(.cols = where(is.character),
                .fns = str_to_lower)) %>% 
  select(site = stationid,
         basin,
         drainage_area,
         family,
         scientific_name,
         common_name,
         count = no_coll) %>% 
  mutate(scientific_name = str_replace_all(scientific_name, "\\s|\\.\\s", "_"),
         common_name = str_remove_all(common_name, '\"') %>% 
           str_replace_all("\\s", "_")) %>% 
  group_by(site) %>% 
  mutate(ma = mean(drainage_area),
         diff = abs(drainage_area - ma),
         drainage_area = ifelse(diff != 0,
                       drainage_area[which.min(diff)],
                       drainage_area)) %>% 
  ungroup() %>% 
  select(-c(ma, diff)) %>% 
  filter(drainage_area > 0)

df_nc_fish %>% 
  group_by(basin, site) %>% 
  summarize(area = unique(drainage_area),
            s = n_distinct(scientific_name)) %>% 
  ungroup() %>% 
  ggplot(aes(x = area,
             y = s,
             color = basin)) +
  geom_point() +
  scale_x_continuous(trans = "log10") +
  scale_y_continuous(trans = "log10")
  
## export
write_csv(df_nc_fish, file = "data/data_nc_fish.csv")
