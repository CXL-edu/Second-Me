CMD_ARGS="--seed 42  --model_name_or_path ${MODEL_BASE_PATH}  --user_name ${USER_NAME}  --dataset_name resources/L2/data/merged.json  --chat_template_format chatml  --add_special_tokens False  --append_concat_token False  --max_seq_length 512  --num_train_epochs 3  --save_total_limit 2  --logging_steps 20  --log_level info  --logging_strategy steps  --save_strategy epoch  --push_to_hub False  --packing False  --learning_rate 2e-4  --lr_scheduler_type cosine  --weight_decay 1e-4  --max_grad_norm 0.3  --output_dir ${MODEL_PERSONAL_DIR}  --per_device_train_batch_size 2  --gradient_accumulation_steps 1  --gradient_checkpointing True  --use_reentrant True  --use_peft_lora True  --lora_r 8  --lora_alpha 16  --lora_dropout 0.1  --lora_target_modules all-linear  --use_4bit_quantization False  --use_nested_quant False  --bnb_4bit_compute_dtype bfloat16"

# Add BF16 option based on the platform
if [ "$PLATFORM" != "apple" ]; then
  CMD_ARGS="$CMD_ARGS --bf16 True"
fi

python lpm_kernel/L2/train.py $CMD_ARGS
