
import 'package:dory/app/app.bottomsheets.dart';
import 'package:dory/app/app.dialogs.dart';
import 'package:dory/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
	final _dialogService = locator<DialogService>();
	final _bottomSheetService = locator<BottomSheetService>();

	List<Map<String, dynamic>> _sp500Metrics = [];

	List<Map<String, dynamic>> get sp500Metrics => _sp500Metrics;

	Future<void> fetchSP500Metrics() async {
		// Mock data for S&P 500 metrics
		_sp500Metrics = [
			{'symbol': 'AAPL', 'price': 150.00, 'change': 1.2},
			{'symbol': 'GOOGL', 'price': 2800.50, 'change': -0.5},
			{'symbol': 'AMZN', 'price': 3400.75, 'change': 0.8},
		];
		rebuildUi();
	}

	void showDialog() {
		_dialogService.showCustomDialog(
			variant: DialogType.infoAlert,
			title: 'S&P 500 Metrics',
			description: 'Successfully fetched the latest S&P 500 metrics.',
		);
	}

	void showBottomSheet() {
		_bottomSheetService.showCustomSheet(
			variant: BottomSheetType.notice,
			title: 'Notice',
			description: 'New S&P 500 metrics are available.',
		);
	}
}
