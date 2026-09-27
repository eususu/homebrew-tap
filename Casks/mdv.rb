cask "mdv" do
  version "0.2"
  # Step 1에서 복사한 해시값을 아래에 붙여넣으세요.
  sha256 "1f80ced6f60f4d714b42b6d8eac80c72dcfadc01e039f9277bfd90f6efb9e296"

  # 실제 GitHub Release에 올라간 자산(asset)의 파일명으로 맞춰주세요.
  url "https://github.com/eususu/mdv/releases/download/v0.2/mdv_0.2.0_aarch64.dmg"
  name "mdv"
  desc "Markdown Viewer"
  homepage "https://github.com/eususu/mdv"

  # DMG 내부에 있는 앱의 정확한 이름을 적어주세요.
  app "mdv.app" 

	# 🚀 추가된 부분: 설치 직후 자동으로 격리(Quarantine) 속성 해제
  postflight_steps do
    system_command "xattr",
                   args: ["-cr", "/Applications/mdv.app"]
  end
  
  # 옵션: 앱을 지울 때 캐시나 설정 파일도 함께 지우도록 설정 (필요시 추가)
  zap trash: [
    "~/Library/Application Support/com.eususu.mdv",
    "~/Library/Preferences/com.eususu.mdv.plist",
  ]
end
