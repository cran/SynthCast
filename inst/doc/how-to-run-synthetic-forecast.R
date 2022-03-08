## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----load SynthCast and df_example--------------------------------------------
library(knitr)
library(SynthCast)
data('df_example')
kable(head(df_example)) 

## ----table max time each unit, message=FALSE----------------------------------
library(dplyr)

df_example %>%
  group_by(unit) %>%
  summarise(max_time_period=max(time_period)) %>%
  filter(unit %in% c(1, 2, 3, 4, 5, 45, 46, 47, 48, 49, 50)) %>% 
  kable()

## ----run_synthetic_forecast function call, message=F--------------------------
synthetic_forecast <- run_synthetic_forecast(
  df = df_example,
  col_unit_name = 'unit',
  col_time='time_period',
  periods_to_forecast=12,
  unit_of_interest = '30',
  serie_of_interest = 'x1'
)

## -----------------------------------------------------------------------------
kable(synthetic_forecast$synthetic_control_composition)

## -----------------------------------------------------------------------------
kable(head(synthetic_forecast$variable_importance_and_comparison,8))

## -----------------------------------------------------------------------------
kable(synthetic_forecast$mape_backtest)

## -----------------------------------------------------------------------------
kable(synthetic_forecast$output_projecao)

## -----------------------------------------------------------------------------
proj<- synthetic_forecast$output_projecao
proj %>% glimpse()

