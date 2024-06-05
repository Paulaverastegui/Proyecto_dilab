# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_06_05_192031) do
  create_table "diagnoses", force: :cascade do |t|
    t.integer "patient_id", null: false
    t.text "description"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "historia_desde"
    t.string "perdida_peso"
    t.string "historia_condicion"
    t.string "historia_cirugia"
    t.string "sintomas_episodios"
    t.string "sintomas_dificultad"
    t.string "sintomas_sensacion"
    t.string "sintomas_dolor"
    t.string "sintomas_frecuencia"
    t.string "sintomas_evita_alimentos"
    t.string "sintomas_cansancio"
    t.string "sintomas_tiempo"
    t.string "sintomas_nuevo"
    t.index ["patient_id"], name: "index_diagnoses_on_patient_id"
  end

  create_table "guss_scales", force: :cascade do |t|
    t.integer "vigilance"
    t.integer "cough"
    t.integer "saliva_swallow"
    t.integer "sialorrhea"
    t.integer "voice_changes"
    t.integer "semi_solids_swallow"
    t.integer "semi_solids_cough"
    t.integer "semi_solids_sialorrhea"
    t.integer "semi_solids_voice_changes"
    t.integer "liquids_swallow"
    t.integer "liquids_cough"
    t.integer "liquids_sialorrhea"
    t.integer "liquids_voice_changes"
    t.integer "solids_swallow"
    t.integer "solids_cough"
    t.integer "solids_sialorrhea"
    t.integer "solids_voice_changes"
    t.integer "diagnosis_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["diagnosis_id"], name: "index_guss_scales_on_diagnosis_id"
  end

  create_table "levels", force: :cascade do |t|
    t.string "escala"
    t.integer "severidad"
    t.integer "diagnosis_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["diagnosis_id"], name: "index_levels_on_diagnosis_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "name"
    t.string "rut"
    t.date "birthdate"
    t.string "sex"
    t.string "email"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_patients_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "diagnoses", "patients"
  add_foreign_key "guss_scales", "diagnoses"
  add_foreign_key "levels", "diagnoses"
  add_foreign_key "patients", "users"
end
