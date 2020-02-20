class MedicalRecordsController < ApplicationController
    before_action :set_medical_record, only: [:show, :edit, :update, :destroy]
  
    # GET /medical_records
    # GET /medical_records.json
    def index
      @medical_record = MedicalRecord.new
      @medical_records = MedicalRecord.all
    end
  
    # GET /medical_records/1
    # GET /medical_records/1.json
    def show
      @medical_record = MedicalRecord.new
    end
  
    # GET /medical_records/new
    def new
      @medical_record = MedicalRecord.new

      @medical_record.practice_email = params[:prac]
      
      @practices = Practice.all
      @doctor_choices = {
        "Select a practice" => ""
      }

      @practices.each do |practice|
        @doctor_choices.store(practice.first_name + " " + practice.last_name, practice.email)
      end

    end
  
    # GET /medical_records/1/edit
    def edit
      @medical_record = MedicalRecord.new
    end
  
    # POST /medical_records
    # POST /medical_records.json
    def create
      @medical_record = MedicalRecord.new(medical_record_params)

      puts "test 1"

      current_patient.medical_records << @medical_record

      @medical_record.patient_email = current_patient.email
  
      respond_to do |format|
        if @medical_record.save
          format.html { redirect_to medical_records_path, notice: 'Medical Record was successfully created.' }
          format.json { render :show, status: :created, location: @medical_record }
        else
          format.html { render :new }
          format.json { render json: @medical_record.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /medical_records/1
    # PATCH/PUT /medical_records/1.json
    def update
      respond_to do |format|
        if @medical_record.update(medical_record_params)
          format.html { redirect_to @medical_record, notice: 'Medical Record was successfully updated.' }
          format.json { render :show, status: :ok, location: @medical_record }
        else
          format.html { render :edit }
          format.json { render json: @medical_record.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /medical_records/1
    # DELETE /medical_records/1.json
    def destroy
      @medical_record.destroy
      respond_to do |format|
        format.html { redirect_to medical_records_url, notice: 'Medical Record was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_medical_record
        @medical_record = MedicalRecord.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def medical_record_params
        params.require(:medical_record).permit(:title, :file, :patient_email, :practice_email)
      end
  end
  